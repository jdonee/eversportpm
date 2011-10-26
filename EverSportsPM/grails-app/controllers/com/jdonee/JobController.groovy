package com.jdonee

import org.codehaus.groovy.grails.commons.ConfigurationHolder
import grails.converters.JSON

class JobController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	// Export service provided by Export plugin
	def exportService
	def departmentService
	def jobService
	def filterPaneService

	def index = {
		redirect(action: "list", params: params)
	}

	def setSearchParamsMax = {
		def max = 1000
		if(params.newMax?.isInteger()) {
			def i = params.newMax.toInteger()
			if(i > 0 && i <= max)
				session.jobSearchParamsMax = params.newMax
			if(i > max)
				session.jobSearchParamsMax = max
		}
		forward(action: "list", params: params)
	}

	def list = {
		if(session.jobSearchParamsMax){
			params.max = session.jobSearchParamsMax
		}else{
			params.max = Math.min( params.max ? params.max.toInteger() : 10,  1000)
		}
		def jobInstanceList = []
		def jobInstanceTotal= 0
		def filterParams = [:]

		// Quick Search:
		if(!params.filter) {
			jobInstanceList = Job.list( params )
			jobInstanceTotal = Job.count()
		}
		else {
			// filterPane:
			jobInstanceList= filterPaneService.filter( params, Job )
			jobInstanceTotal= filterPaneService.count( params, Job )
			filterParams= org.grails.plugin.filterpane.FilterPaneUtils.extractFilterParams(params)
		}

		// export plugin:
		if(params?.format && params.format != "html"){
			def dateFmt = { domain, value ->
				formatDate(format: "EEE, dd-MMM-yyyy", date: value)
			}
			String title = "${message(code: 'job.jobList.label',default: 'Job List')}"
			response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
			response.setHeader("Content-disposition", "attachment; filename=jobs.${params.extension}")

			List fields = [
				"user.employeeName",
				"user.username",
				"name",
				"code",
				"jobType.name",
				"parentCode",
				"company.name",
				"department.name",
				"companyResponsible",
				"closed",
				"dateCreated"
			]
			Map labels =  ["user.employeeName":"${message(code: 'user.employeeName.label', default: 'Employee Name')}",
				"user.username":"${message(code: 'user.username.label', default: 'User Name')}",
				"name":"${message(code: 'job.name.label', default: 'Name')}", 
				"code":"${message(code: 'job.code.label', default: 'Code')}",
				"jobType.name":"${message(code: 'job.jobType.label', default: 'Job Type')}",
				"parentCode":"${message(code: 'job.parentCode.label', default: 'Parent Code')}",
				"company.name":"${message(code: 'company.name.label', default: 'Company')}",
				"department.name":"${message(code: 'department.name.label', default: 'Department')}",
				"companyResponsible":"${message(code: 'job.companyResponsible.label', default: 'Company Responsible')}",
				"closed":"${message(code: 'job.closed.label', default: 'Closed')}",
				"dateCreated":"${message(code: 'job.dateCreated.label', default: 'Date Created')}"]

			/* Formatter closure in previous releases
			 * def upperCase = { value -> return value.toUpperCase() }
			 *  */

			// Formatter closure
			def upperCase = { domain, value -> return value.toUpperCase() }

			Map formatters = [name: upperCase]
			Map parameters = [title: title, separator: ",","column.widths": [0.2, 0.3, 0.5]]

			exportService.export(params.format, response.outputStream, jobInstanceList.sort { p1, p2 -> p1.name.compareToIgnoreCase(p2.name) }, fields, labels, formatters, parameters)
		}

		// Add some basic params to filterParams.
		filterParams.max = params.max
		filterParams.offset = params.offset?.toInteger() ?: 0
		filterParams.sort = params.sort ?: "id"
		filterParams.order = params.order ?: "desc"

		return[ jobInstanceList: jobInstanceList,
			jobInstanceTotal: jobInstanceTotal,
			filterParams: filterParams ]

	}


	def getDepartments ={
		assert null != params.companyId
		render departmentService.findAllDepartmentByCompany(params.companyId) as JSON
	}

	def autocompleteSearchCode = {
		assert null != params.q
		render jobService.findAllJobByCode(params.q) as JSON
	}

	def create = {
		def jobInstance = new Job()
		jobInstance.properties = params
		return [jobInstance: jobInstance]
	}

	def save = {
		def jobInstance = new Job(params)
		if (jobInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'job.label', default: 'Job'), jobInstance.id])}"
			redirect(action: "show", id: jobInstance.id)
		}
		else {
			render(view: "create", model: [jobInstance: jobInstance])
		}
	}

	def show = {
		def jobInstance = Job.get(params.id)
		if (!jobInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'job.label', default: 'Job'), params.id])}"
			redirect(action: "list")
		}
		else {
			[jobInstance: jobInstance]
		}
	}

	def edit = {
		def jobInstance = Job.get(params.id)
		if (!jobInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'job.label', default: 'Job'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [jobInstance: jobInstance]
		}
	}

	def update = {
		def jobInstance = Job.get(params.id)
		if (jobInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (jobInstance.version > version) {

					jobInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'job.label', default: 'Job')]
					as Object[], "Another user has updated this Job while you were editing")
					render(view: "edit", model: [jobInstance: jobInstance])
					return
				}
			}
			jobInstance.properties = params
			if (!jobInstance.hasErrors() && jobInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'job.label', default: 'Job'), jobInstance.id])}"
				redirect(action: "show", id: jobInstance.id)
			}
			else {
				render(view: "edit", model: [jobInstance: jobInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'job.label', default: 'Job'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete = {
		def jobInstance = Job.get(params.id)
		if (jobInstance) {
			try {
				jobInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'job.label', default: 'Job'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'job.label', default: 'Job'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'job.label', default: 'Job'), params.id])}"
			redirect(action: "list")
		}
	}
}
