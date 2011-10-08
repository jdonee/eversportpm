package com.jdonee

class UserService {

    static transactional = true

    def findAllUserByUserName(username) {
		def result = User.withCriteria{
			            projections{
							property("id")
			                property("username")
							property("firstName")
							property("lastName")
			            }
			            ilike("username","%"+username + "%")
						eq("enabled",Boolean.TRUE)
						eq("accountExpired",Boolean.FALSE)
						eq("accountLocked",Boolean.FALSE)
						eq("passwordExpired",Boolean.FALSE)
			            maxResults(20)
			            order("id", "asc")
			        }
		return result
     }  
}
