package com.jdonee

import grails.converters.JSON
import com.jdonee.utils.PerformanceStatus
import com.jdonee.utils.Constants
class PersonalPerformanceController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	def personalPerformanceService
	def jobService

	def index = {
		redirect(action: "list", params: params)
	}

	def searchJobByCodeJSON = {
		String code = params.remove('term');
		List jobs = jobService.searchJobByCode(code)
		render jobs as JSON
	}

	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[personalPerformanceInstanceList: personalPerformanceService.findAllPersonalPerformanceByUser(currentUser,params), personalPerformanceInstanceTotal: PersonalPerformance.count()]
	}

	def create = {
		def personalPerformanceInstance = new PersonalPerformance()
		personalPerformanceInstance.properties = params
		return [personalPerformanceInstance: personalPerformanceInstance,jobInstanceList:jobService.findAllJobByUser(currentUser)]
	}

	def save = {
		def personalPerformanceInstance = new PersonalPerformance(params)
		if(checkUnique(params)!=null){
			flash.message = "${message(code: 'personalPerformance.unique.failure', default:'This performance can only exist in one of the available record.')}"
			render(view: "create", model: [personalPerformanceInstance: personalPerformanceInstance,jobInstanceList:jobService.findAllJobByUser(currentUser)])
			return
		}
		if (personalPerformanceInstance.save(flush: true)) {
			personalPerformanceService.initPersonalPerformance(personalPerformanceInstance)
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
			redirect(action: "show", id: personalPerformanceInstance.id)
		}
		else {
			render(view: "create", model: [personalPerformanceInstance: personalPerformanceInstance,jobInstanceList:jobService.findAllJobByUser(currentUser)])
		}
	}

	def savePeripheralPeople={
		def personalPerformanceInstance = PersonalPerformance.get(params.personalPerformanceId)
		def newCodes=params.peripheralPeople.replaceAll(~" ","")//去除空格
		if(newCodes.endsWith(Constants.COMMA_SEPARATOR)){
			newCodes=newCodes.substring(0,newCodes.length()-1).tokenize(Constants.COMMA_SEPARATOR)//转换成数组
		}else{
			newCodes=newCodes.tokenize(Constants.COMMA_SEPARATOR)//转换成数组
		}
		def queryCodes=[]
		def showCodes=[]
		def peripheralPeople=personalPerformanceInstance.peripheralPeople
		if(peripheralPeople!=null){//如果存在周边评价人
			def oldCodes=peripheralPeople.tokenize(Constants.COMMA_SEPARATOR)
			queryCodes=newCodes.unique()-oldCodes.unique()//查询使用差集，避免重复显示
			showCodes=newCodes.unique()+oldCodes.unique()//显示使用合集，以便更新周边评价岗位。
			personalPerformanceInstance.peripheralPeople=showCodes.unique().join(Constants.COMMA_SEPARATOR)//转换成字符串
		}else{
			queryCodes=newCodes
			personalPerformanceInstance.peripheralPeople=queryCodes.unique().join(Constants.COMMA_SEPARATOR)
		}
		personalPerformanceInstance.save(flush: true)
		def peripheralPeoples=[]
		if(queryCodes!=[]){
			peripheralPeoples=jobService.findAllPeripheralPeopleByCodes(queryCodes.unique()).collect() {
				return [
					company:it.company.name,
					department:it.department.name,
					user:it.user.username,
					name:it.name,
					code:it.code
				]
			}
		}
		render peripheralPeoples as JSON
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

	def edit = {
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (!personalPerformanceInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [personalPerformanceInstance: personalPerformanceInstance,jobInstanceList:jobService.findAllJobByUser(currentUser)]
		}
	}

	def inputFinish = {
		/*指标输入完成*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			if(!personalPerformanceService.isJusticeWeight(personalPerformanceInstance)){
				flash.message = "${message(code: 'personalPerformance.not.updated.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance')])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
				return
			}
			personalPerformanceInstance.status=PerformanceStatus.INPUT_FINISHED
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.inputFinish.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}

	def refreshInput = {
		/*重新输入*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			personalPerformanceInstance.status=PerformanceStatus.INIT
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.refreshInput.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}

	def audit = {
		/*审核*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			if(personalPerformanceInstance.peripheralPeople!=null&&personalPerformanceInstance.peripheralPeople.length()>0){
				def jobs=jobService.findAllPeripheralPeopleByCodes(personalPerformanceInstance.peripheralPeople.tokenize(Constants.COMMA_SEPARATOR))
				def jobRules=personalPerformanceInstance.jobRules
				if(jobRules){
					jobRules.each { value ->
						personalPerformanceService.saveJobRuleScores(value,jobs)
					}
				}	
			}
			personalPerformanceInstance.status=PerformanceStatus.SUPERIOR_AUDITING
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.audit.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}
	
	def abandon = {
		/*弃审*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			personalPerformanceInstance.jobRules.each {  JobRuleScore.removeAll(it) }
			personalPerformanceInstance.status=PerformanceStatus.INPUT_FINISHED
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.abandon.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}
	
	def openAssess = {
		/*准备考核*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			personalPerformanceInstance.status=PerformanceStatus.OPEN_ASSESS
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.openAssess.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}

	def update = {
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			if(checkUnique(params)!=null){
				flash.message = "${message(code: 'personalPerformance.unique.failure', default:'This performance can only exist in one of the available record.')}"
				render(view: "edit", model: [personalPerformanceInstance: personalPerformanceInstance,jobInstanceList:jobService.findAllJobByUser(currentUser)])
				return
			}
			if (params.version) {
				def version = params.version.toLong()
				if (personalPerformanceInstance.version > version) {

					personalPerformanceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'personalPerformance.label', default: 'PersonalPerformance')]
					as Object[], "Another user has updated this PersonalPerformance while you were editing")
					render(view: "edit", model: [personalPerformanceInstance: personalPerformanceInstance,jobInstanceList:jobService.findAllJobByUser(currentUser)])
					return
				}
			}
			personalPerformanceInstance.properties = params
			if (!personalPerformanceInstance.hasErrors() && personalPerformanceInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
			else {
				render(view: "edit", model: [personalPerformanceInstance: personalPerformanceInstance,jobInstanceList:jobService.findAllJobByUser(currentUser)])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
			redirect(action: "list")
		}
	}

	def deletePeripheralPeopleByCode={
		def personalPerformanceInstance = PersonalPerformance.get(params.personalPerformanceId)
		def queryCodes=[]
		def newCodes=[]
		def messageMap=[:]
		if (personalPerformanceInstance) {
			def peripheralPeople=personalPerformanceInstance.peripheralPeople
			if(peripheralPeople!=null&&peripheralPeople.length()>0){//如果存在周边评价人
				def code=params.code
				queryCodes=code.tokenize(Constants.COMMA_SEPARATOR)
				def oldCodes=peripheralPeople.tokenize(Constants.COMMA_SEPARATOR)
				newCodes=oldCodes.unique()-queryCodes.unique()
				personalPerformanceInstance.peripheralPeople=newCodes.unique().join(Constants.COMMA_SEPARATOR)
				personalPerformanceInstance.save(flush: true)
				messageMap.put("message", "${message(code: 'default.deleted.message', args: [message(code: 'personalPerformance.peripheralPeople.label', default: 'Peripheral People'), params.code])}")
			}else{
				messageMap.put("error", "${message(code: 'default.not.deleted.message', args: [message(code: 'personalPerformance.peripheralPeople.label', default: 'Peripheral People'), params.code])}")
			}
		}
		render messageMap as JSON
	}


	def delete = {
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			try {
				personalPerformanceInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
			redirect(action: "list")
		}
	}

	private getCurrentUser() {
		return User.get(springSecurityService.principal.id)
	}

	def checkUnique(def params){
		return PersonalPerformance.findByPerformanceAndJob(Performance.get(params.long('performance.id')),Job.get(params.long('job.id')))
	}
}
