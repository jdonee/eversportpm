package com.jdonee

import com.jdonee.utils.Constants

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

	def findAllPeripheralPeopleByCodes(codes){
		return Job.withCriteria{ 'in'("code",codes) }
	}

	def findCurrectJobByCode(code){
		return Job.findByCodeAndClosed(code,Boolean.FALSE)
	}

	def searchJobByCode(code){
		return Job.findAllByCodeLike(code + '%').collect() {
			return [
				id: it.id,
				label: it.code+"["+it.name+"("+it.user.username+")]",
				value: it.code
			]
		}
	}

	/**
	 * 检查用户是否是HR或者有下属岗位
	 * @param user
	 * @return
	 */
	def checkPermissionByUser(user){
		def boo=Boolean.FALSE
		def jobs=Job.withCriteria{
				eq "user",user
				eq "companyResponsible",Boolean.TRUE
				eq("closed",Boolean.FALSE)
		}
		if(jobs){
			boo=Boolean.TRUE
		}else{
			def codes=Job.withCriteria{
				projections{ property("code") }
				eq "user",user
			}.join(Constants.COMMA_SEPARATOR)
			def c = Job.createCriteria()
			def results=c.get{
				projections{ property("code") }
				'in'("parentCode",codes)
				eq("closed",Boolean.FALSE)
			}
			if(results!=null){
				boo=Boolean.TRUE
			}
		}
		return boo
	}

	/**
	 * 检查当前用户是否具有某个人考核的管理权限
	 * @param user
	 * @param jobCode
	 * @return
	 */
	def checkPermissionByUserAndJobCode(user,jobCode){
		def boo=Boolean.FALSE
		def jobs=Job.withCriteria{
				eq "user",user
				eq "companyResponsible",Boolean.TRUE
				eq("closed",Boolean.FALSE)
			}
		if(jobs){
			boo=Boolean.TRUE
		}else{
			def codes=Job.withCriteria{
				projections{ property("code") }
				eq ("user",user)
				eq ("closed",Boolean.FALSE)
			}.join(Constants.COMMA_SEPARATOR)
			def c = Job.createCriteria()
			def parentCode=c.get{
				projections{ property("parentCode") }
				eq ("code",jobCode)
				eq ("closed",Boolean.FALSE)
			}
			if(parentCode in codes){
				boo=Boolean.TRUE
			}
		}
		return boo
	}

	def findAllJobByUser(user){
		def results=[]
		def jobs=Job.withCriteria{
				eq "user",user
				eq "companyResponsible",Boolean.TRUE
				eq("closed",Boolean.FALSE)
			}
		if(jobs){
			results=Job.findAllByClosed(Boolean.FALSE)
		}else{
			def codes=Job.withCriteria{
				projections{ property("code") }
				eq "user",user
			}.join(Constants.COMMA_SEPARATOR)
			results=Job.withCriteria{
				or{
					'in'("code",codes)
					'in'("parentCode",codes)
				}
				eq("closed",Boolean.FALSE)
			}
		}
		return results
	}
	
	/**
	* 获取用户所有的岗位代码
	* @param user
	* @return
	*/
   def getCodesByUser(user){
	   return Job.withCriteria{
		   projections{ property("code") }
		   eq "user",user
		   eq("closed",Boolean.FALSE)
	   }
   }
}
