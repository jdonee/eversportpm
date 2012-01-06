package com.jdonee

import com.jdonee.utils.TemplateType
import com.jdonee.utils.Constants
import com.jdonee.utils.PerformanceStatus

class PersonalPerformanceService {

	static transactional = true
	
	def findAllPersonalPerformancesByPerformanceAndJob(performanceId,jobId) {
		def result = PersonalPerformance.withCriteria{
						projections{
							property("id")
							property("job")
							property("performance")
						}
						eq("job",Job.get(jobId.toLong()))
						not{
							eq("performance",Performance.get(performanceId.toLong()))
							eq("status",PerformanceStatus.INIT)
						}
						//maxResults(100)
						order("id", "asc")
					}
		return result
	 }

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
	
	def checkPersonalPerformanceByUser(user,codes,id) {
		def boo=Boolean.FALSE
		def jobs=Job.findAllByUserAndCompanyResponsible(user,Boolean.TRUE)
		if(jobs){
			boo=Boolean.TRUE
		}else{
			def results = PersonalPerformance.withCriteria{
				job{
					or{
						'in'("code",codes)
						'in'("parentCode",codes)
					}
				}
				eq("id",id)
			}
			if(results){
				boo=Boolean.TRUE
			}
		}
		return boo
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
	
	def copyPersonalPerformance(sourcePersonalPerformanceInstance,personalPerformanceInstance){
		sourcePersonalPerformanceInstance.kpiRules.each { rule-> 
			def kpiRule=new KpiRule(desiredItem:rule.desiredItem,targetValue:rule.targetValue,weight:rule.weight,description:rule.description,personalPerformance:personalPerformanceInstance)
			kpiRule.save(flush:true)
		}
		sourcePersonalPerformanceInstance.jobRules.each { rule->
			if(rule.customed==Boolean.TRUE){
				def jobRule=new JobRule(jobItem:rule.jobItem,customed:rule.customed,personalPerformance:personalPerformanceInstance)
				jobRule.save(flush:true)
			}
		}
		sourcePersonalPerformanceInstance.companyRules.each { rule->
			if(rule.customed==Boolean.TRUE){
				def companyRule=new CompanyRule(content:rule.content,customed:rule.customed,personalPerformance:personalPerformanceInstance)
				companyRule.save(flush:true)
			}	
		}
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
