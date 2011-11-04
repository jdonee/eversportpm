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
			            maxResults(20)
			            order("code", "asc")
			        }
		return result
     }
	
	def searchJobByCode(code){
		return Job.findAllByCodeLike(code + '%').collect() {
			return [
					id: it.id,
					label: it.code+"["+it.name+"("+it.user.username+")]",
					//label: it.code+"["+it.name+"]",
					value: it.code
			]
		}
	 }
}
