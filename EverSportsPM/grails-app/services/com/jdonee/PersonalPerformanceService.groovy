package com.jdonee

import com.jdonee.utils.TemplateType
import com.jdonee.utils.Constants
import com.jdonee.utils.PerformanceStatus

class PersonalPerformanceService {

	static transactional = true

	def findAllPersonalPerformanceByUser(user,codes,params) {
		def results=[]
		def jobs=Job.findAllByUserAndCompanyResponsible(user,Boolean.TRUE)
		if(jobs){
			results=PersonalPerformance.list(params)
		}else{
			results = PersonalPerformance.withCriteria{
				job{
					or{
						'in'("code",codes)
						'in'("parentCode",codes)
					}
				}
				maxResults params.max
			}
		}
		return results
	}

	def findAllMyPersonalPerformanceByUser(codes,params) {
		def results=[]
		results = PersonalPerformance.withCriteria{
			'in'("status",[
				PerformanceStatus.OPEN_ASSESS,
				PerformanceStatus.SUPERIOR_SUMMARY
			])
			job{ 'in'("code",codes) }
			maxResults params.max
		}
		return results
	}

	def findAllPeripheralPersonalPerformanceByUser(codes,params) {
		def results=[]
		codes.each { jobCode->
			results += PersonalPerformance.withCriteria{
				'in'("status",[
					PerformanceStatus.PERSON_SUMMARY
				])
				and{
					like("peripheralPeople","%"+jobCode+"%")
				}
				maxResults params.max
			}
		}
		return results.unique().sort()
	}

	def findAllSuperiorPersonalPerformanceByUser(user,codes,params) {
		def results=[]
		def jobs=Job.findAllByUserAndCompanyResponsible(user,Boolean.TRUE)
		if(jobs){
			results = PersonalPerformance.withCriteria{
				'in'("status",[
					PerformanceStatus.PERSON_SUMMARY,
					PerformanceStatus.SUPERIOR_SUMMARY,
					PerformanceStatus.PERSON_AFFIRM,
					PerformanceStatus.SUPERIOR_AFFIRM,
					PerformanceStatus.CLOSE_ASSESS
				])
				maxResults params.max
			}
		}else{
			results = PersonalPerformance.withCriteria{
				'in'("status",[
					PerformanceStatus.PERSON_SUMMARY,
					PerformanceStatus.SUPERIOR_SUMMARY,
					PerformanceStatus.PERSON_AFFIRM,
					PerformanceStatus.SUPERIOR_AFFIRM,
					PerformanceStatus.CLOSE_ASSESS
				])
				job{'in'("parentCode",codes) }
				maxResults params.max
			}
		}
		return results
	}

	def initPersonalPerformance(personalPerformanceInstance){
		if(personalPerformanceInstance.performance.useTemplate){
			def jobContent=SystemTemplate.withCriteria(uniqueResult:true) {
				projections{ property("templateContent") }
				eq('templateType', TemplateType.JOB)
				eq("enabled",Boolean.TRUE)
			}
			if(jobContent){
				def temps=jobContent.tokenize(Constants.DEFAULT_SEPARATOR)
				if(temps){
					temps.each{ value ->
						def jobRule=new JobRule(jobItem:value,customed:Boolean.FALSE,personalPerformance:personalPerformanceInstance)
						jobRule.save(flush:true)
					}
				}
			}
			def companyContent=SystemTemplate.withCriteria(uniqueResult:true) {
				projections{ property("templateContent") }
				eq('templateType', TemplateType.COMPANY)
				eq("enabled",Boolean.TRUE)
			}
			if(companyContent){
				def temps=companyContent.tokenize(Constants.DEFAULT_SEPARATOR)
				if(temps){
					temps.each{ value ->
						def companyRule= new CompanyRule(content:value,customed:Boolean.FALSE,personalPerformance:personalPerformanceInstance)
						companyRule.save(flush:true)
					}
				}
			}
		}
	}

	def isJusticeWeight(personalPerformance) {
		def c = KpiRule.createCriteria()
		def weights=c.get{
			projections{ sum("weight") }
			eq "personalPerformance",personalPerformance
		}
		if(weights==null){
			weights=0
		}
		return weights== Constants.TOTAL_SCORE
	}

	def saveJobRuleScores(jobRule,jobs){
		jobs.each {  job ->
			def jobRuleScoreInstance=new JobRuleScore(job:job,jobRule:jobRule)
			jobRuleScoreInstance.save(flush: true)
		}
	}

	def changeJobRuleScore(jobRule){
		def jobRuleScoreCount=JobRuleScore.countByJobRuleAndUsed(jobRule,Boolean.TRUE)
		if(jobRuleScoreCount>0){
			def c=JobRuleScore.createCriteria()
			def scores=c.get{
				projections{ sum("score") }
				eq "jobRule",jobRule
				eq "used",Boolean.TRUE
			}
			jobRule.peripheralScore=(scores/jobRuleScoreCount as Integer)
			jobRule.save(flush: true)
		}
	}
	
}
