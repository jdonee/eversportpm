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
	
	def findAllJobByUser(user){
		def results=[]
		def jobs=Job.findAllByUserAndCompanyResponsible(user,Boolean.TRUE)
		if(jobs){
			results=Job.list()
		}else{
			def codes=Job.withCriteria{
				projections{ property("code") }
				eq "user",user
			}.join(",")
			results=Job.withCriteria{
				or{
					'in'("code",codes)
					'in'("parentCode",codes)
				}
			}
		}
		return results
	}
}
