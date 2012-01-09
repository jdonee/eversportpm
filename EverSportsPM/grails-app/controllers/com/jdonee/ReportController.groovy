package com.jdonee

import org.codehaus.groovy.grails.commons.ConfigurationHolder
import com.jdonee.PersonalPerformance

class ReportController {
	
	static allowedMethods =[GET:"show", PUT:"update", DELETE:"delete", POST:"save"]

	def springSecurityService
	def exportService
	def personalPerformanceService
	def filterPaneService
	def jobService

	def index = {
		redirect(action: "list", params: params)
	}
	
	def setSearchParamsMax = {
		def max = 1000
		if(params.newMax?.isInteger()) {
			def i = params.newMax.toInteger()
			if(i > 0 && i <= max)
				session.personalPerformanceSearchParamsMax = params.newMax
			if(i > max)
				session.personalPerformanceSearchParamsMax = max
		}
		forward(action: "list", params: params)
	}
	
	def list = {
		if(session.personalPerformanceSearchParamsMax){
			params.max = session.personalPerformanceSearchParamsMax
		}else{
			params.max = Math.min( params.max ? params.max.toInteger() : 10,  1000)
		}
		def personalPerformanceInstanceList = []
		def personalPerformanceInstanceTotal= 0
		def filterParams = [:]

		// Quick Search:
		if(!params.filter) {
			personalPerformanceInstanceList = PersonalPerformance.list( params )
			personalPerformanceInstanceTotal = PersonalPerformance.count()
		}
		else {
			// filterPane:
			personalPerformanceInstanceList= filterPaneService.filter( params, PersonalPerformance )
			personalPerformanceInstanceTotal= filterPaneService.count( params, PersonalPerformance )
			filterParams= org.grails.plugin.filterpane.FilterPaneUtils.extractFilterParams(params)
		}

		// export plugin:
		if(params?.format && params.format != "html"){
			def dateFmt = { domain, value ->
				formatDate(format: "EEE, dd-MMM-yyyy", date: value)
			}
			String title = "${message(code: 'personPerformanceReport.list.label',default: 'Person Performance Report')}"
			response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
			response.setHeader("Content-disposition", "attachment; filename=personPerformances.${params.extension}")

			List fields = [
				"performance",
				"job.company.name",
				"job.department.name",
				"job.user.employeeName",
				"job.name",
				"job.code",
				"job.parentCode",
				"job.jobType.name",
				"job.closed",
				"mainLevel",
				"companyRuleLevel",
				"kpiRuleScore",
				"jobRuleScore",
				"score",
				"status.label",
				"dateCreated"
			]
			Map labels =  [
				"performance":"${message(code: 'personalPerformance.performance.label', default: 'Performance')}",
				"job.company.name":"${message(code: 'company.name.label', default: 'Company')}",
				"job.department.name":"${message(code: 'department.name.label', default: 'Department')}",
				"job.user.employeeName":"${message(code: 'user.employeeName.label', default: 'Employee Name')}",
				"job.name":"${message(code: 'job.name.label', default: 'Name')}",
				"job.code":"${message(code: 'job.code.label', default: 'Code')}",
				"job.parentCode":"${message(code: 'job.parentCode.label', default: 'Parent Code')}",
				"job.jobType.name":"${message(code: 'job.jobType.label', default: 'Job Type')}",
				"job.closed":"${message(code: 'job.closed.label', default: 'Closed')}",
				"mainLevel":"${message(code: 'personalPerformance.mainLevel.label', default: 'Main Level')}",
				"companyRuleLevel":"${message(code: 'personalPerformance.companyRuleLevel.label', default: 'Company Rule Level')}",
				"kpiRuleScore":"${message(code: 'personalPerformance.kpiRuleScore.label', default: 'Kpi Rule Score')}",
				"jobRuleScore":"${message(code: 'personalPerformance.jobRuleScore.label', default: 'Job Rule Score')}",
				"score":"${message(code: 'personalPerformance.score.label', default: 'Score')}",
				"status.label":"${message(code: 'personalPerformance.status.label', default: 'Status')}",
				"dateCreated":"${message(code: 'personalPerformance.dateCreated.label', default: 'Date Created')}",
				]

			/* Formatter closure in previous releases
			 * def upperCase = { value -> return value.toUpperCase() }
			 *  */

			// Formatter closure
			def upperCase = { domain, value -> return value.toUpperCase() }

			Map formatters = [name: upperCase]
			Map parameters = [title: title, separator: ",","column.widths": [0.2, 0.3, 0.5]]

			exportService.export(params.format, response.outputStream, personalPerformanceInstanceList.sort { p1, p2 -> p1.performance.name.compareToIgnoreCase(p2.performance.name) }, fields, labels, formatters, parameters)
		}

		// Add some basic params to filterParams.
		filterParams.max = params.max
		filterParams.offset = params.offset?.toInteger() ?: 0
		filterParams.sort = params.sort ?: "id"
		filterParams.order = params.order ?: "desc"

		return[ personalPerformanceInstanceList: personalPerformanceInstanceList,
			personalPerformanceInstanceTotal: personalPerformanceInstanceTotal,
			filterParams: filterParams ]
	}
	
	def show = {
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		def jobInstanceList=[]
		if (!personalPerformanceInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
			redirect(action: "list")
		}
		else {
			def peripheralPeople=personalPerformanceInstance.peripheralPeople
			if(peripheralPeople!=null&&peripheralPeople.length()>0){
				jobInstanceList=jobService.findAllPeripheralPeopleByCodes(peripheralPeople.tokenize(Constants.COMMA_SEPARATOR))
			}
			[personalPerformanceInstance: personalPerformanceInstance,checkPermission:jobService.checkPermissionByUserAndJobCode(currentUser,personalPerformanceInstance.job.code),jobInstanceList:jobInstanceList]
		}
	}
	
	private getCurrentUser() {
		return User.get(springSecurityService.principal.id)
	}
}
