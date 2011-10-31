package com.jdonee

import org.hibernate.FetchMode as FM

class PersonalPerformanceService {

	static transactional = true

	def findAllPersonalPerformanceByUser(user,params) {
		def results=[]
		def jobs=Job.findAllByUserAndCompanyResponsible(user,Boolean.TRUE)
		if(jobs.size()>0){
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
}
