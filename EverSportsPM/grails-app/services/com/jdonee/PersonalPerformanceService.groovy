package com.jdonee

import com.jdonee.utils.TemplateType
import com.jdonee.utils.Constants

class PersonalPerformanceService {

	static transactional = true

	def findAllPersonalPerformanceByUser(user,params) {
		def results=[]
		def jobs=Job.findAllByUserAndCompanyResponsible(user,Boolean.TRUE)
		if(jobs){
			results=PersonalPerformance.list(params)
		}else{
			def codes=Job.withCriteria{
				projections{ property("code") }
				eq "user",user
			}.join(Constants.COMMA_SEPARATOR)
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

	/**
	 * 检查当前用户是否具有权限
	 * @param user
	 * @param jobCode
	 * @return
	 */
	def checkPermissionByUserAndJobCode(user,jobCode){
		def boo=Boolean.FALSE
		def jobs=Job.findAllByUserAndCompanyResponsible(user,Boolean.TRUE)
		if(jobs){
			boo=Boolean.TRUE
		}else{
			def codes=Job.withCriteria{
				projections{ property("code") }
				eq "user",user
			}.join(Constants.COMMA_SEPARATOR)
			def c = Job.createCriteria()
			def parentCode=c.get{
				 projections{ property("parentCode") }
				 eq ("code",jobCode)
			}
			if(parentCode in codes){
				boo=Boolean.TRUE
			}
		}
		return boo
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
						def companyRule= new CompanyRule(content:value,personalPerformance:personalPerformanceInstance)
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
}
