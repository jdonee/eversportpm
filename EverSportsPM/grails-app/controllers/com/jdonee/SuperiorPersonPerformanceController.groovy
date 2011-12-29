package com.jdonee

import grails.converters.JSON
import com.jdonee.utils.PerformanceStatus
import com.jdonee.utils.Constants
class SuperiorPersonPerformanceController {
	def springSecurityService
	def personalPerformanceService
	def jobService
	def scoreLevelService

    def index = {
		redirect(action: "list", params: params)
	}
	
	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[personalPerformanceInstanceList: personalPerformanceService.findAllSuperiorPersonalPerformanceByUser(currentUser,jobService.getCodesByUser(currentUser),params), personalPerformanceInstanceTotal: PersonalPerformance.count()]
	}
	
	def show = {
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		def jobInstanceList=[]
		if (!personalPerformanceInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
			redirect(action: "list")
		}
		else {
			[personalPerformanceInstance: personalPerformanceInstance]
		}
	}
	
	def superiorSummary = {
		/*完成上级考评*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			personalPerformanceInstance.companyRuleLevel=params.companyRuleLevel
			scoringPersonalPerformance(personalPerformanceInstance)
			personalPerformanceInstance.status=PerformanceStatus.SUPERIOR_SUMMARY
			if( personalPerformanceInstance.save(flush: true)){				
				flash.message = "${message(code: 'personalPerformance.superiorSummary.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}
	
	def refreshSuperiorSummary = {
		/*上级重新考评*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			personalPerformanceInstance.kpiRuleScore=0
			personalPerformanceInstance.jobRuleScore=0
			personalPerformanceInstance.score=0
			personalPerformanceInstance.mainLevel=null
			personalPerformanceInstance.status=PerformanceStatus.PERSON_SUMMARY
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.personSummary.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}
	
	def superiorAffirm = {
		/*完成上级确认*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			personalPerformanceInstance.status=PerformanceStatus.SUPERIOR_AFFIRM
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.superiorAffirm.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}
	
	def refreshSuperiorAffirm = {
		/*上级重新确认*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			personalPerformanceInstance.feedback=null
			personalPerformanceInstance.feedbackPeople=null
			personalPerformanceInstance.status=PerformanceStatus.PERSON_AFFIRM
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.personAffirm.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}
	
	def closeAssess = {
		/*关闭考核*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			personalPerformanceInstance.status=PerformanceStatus.CLOSE_ASSESS
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.closeAssess.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}
	
	def addFeedback = {
		/*增加反馈*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		def objectMap=[:]
		if (personalPerformanceInstance) {
			personalPerformanceInstance.properties = params
			if (personalPerformanceInstance.save(flush: true)) {
				objectMap.put("feedback",personalPerformanceInstance.feedback==null?"":personalPerformanceInstance.feedback)
				objectMap.put("feedbackPeople",personalPerformanceInstance.feedbackPeople==null?"":personalPerformanceInstance.feedbackPeople)
			}
		}
		render objectMap as JSON
	}
	
	private getCurrentUser() {
		return User.get(springSecurityService.principal.id)
	}
	
	def scoringPersonalPerformance(personalPerformanceInstance){
		def performanceInstance=personalPerformanceInstance.performance
		def kpiRules=personalPerformanceInstance.kpiRules
		if(kpiRules){
			def kpiRuleScore=0
			kpiRules.each { kpiRule ->
				kpiRuleScore+=(kpiRule.score*kpiRule.weight/Constants.WEIGHT_PERCENT as Integer)
			}
			personalPerformanceInstance.kpiRuleScore=kpiRuleScore //统计KPI得分
		}
		def jobRules=personalPerformanceInstance.jobRules
		if(jobRules){
			def jobRuleScore=0
			jobRules.each { jobRule ->
				if(jobRule.peripheralScore!=null&&jobRule.peripheralScore>0){//如有周边评分纳入计算范围，否则只计算领导评分
					jobRuleScore+=((jobRule.score*(Constants.WEIGHT_PERCENT-performanceInstance.peripheralWeight)/Constants.WEIGHT_PERCENT
						+jobRule.peripheralScore*performanceInstance.peripheralWeight/Constants.WEIGHT_PERCENT) as Integer)
				}else{
					jobRuleScore+=jobRule.score
				}
			}
			personalPerformanceInstance.jobRuleScore=(jobRuleScore/jobRules.size() as Integer) //统计岗位职责要项得分
		}
		//KPI得分*KPI权重/100+岗位职责要项分数*岗位职责权重/100=总分
		personalPerformanceInstance.score=((personalPerformanceInstance.kpiRuleScore*performanceInstance.mainWeight/Constants.WEIGHT_PERCENT+personalPerformanceInstance.jobRuleScore*performanceInstance.auxiliaryWeight/Constants.WEIGHT_PERCENT) as Integer)
		def level=scoreLevelService.getLevelByScore(personalPerformanceInstance.score)
		if(level!=null){
			personalPerformanceInstance.mainLevel=level
		}
	}
}
