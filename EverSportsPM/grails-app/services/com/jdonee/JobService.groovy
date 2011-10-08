package com.jdonee

class JobService {

    static transactional = true

    def findAllJobByCode(code) {
		def result = Job.withCriteria{
			            projections{
			                property("code")
							property("name")
			            }
			            ilike("code",code + "%")
						eq("closed",Boolean.FALSE)
			            maxResults(10)
			            order("code", "asc")
			        }
		return result
     }  
}
