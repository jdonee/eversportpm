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
			}.join(",")
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
	
	def initPersonalPerformance(personalPerformanceInstance){
			if(personalPerformanceInstance.performance.useTemplate){
			def jobContent=SystemTemplate.withCriteria(uniqueResult:true) {
					projections{
						property("templateContent")
					}
					eq('templateType', TemplateType.JOB)
					eq("enabled",Boolean.TRUE)
				}
			if(jobContent){
				def temps=jobContent.tokenize(Constants.DEFAULT_SEPARATOR)
				if(temps){
					temps.each{ value ->
						 def jobRule=new JobRule(jobItem:value,personalPerformance:personalPerformanceInstance)
						 jobRule.save(flush:true)
				}
				}
			}
			def companyContent=SystemTemplate.withCriteria(uniqueResult:true) {
				projections{
					property("templateContent")
				}
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
}
