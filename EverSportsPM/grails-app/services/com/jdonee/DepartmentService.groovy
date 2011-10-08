package com.jdonee

class DepartmentService {

    static transactional = true

    def findAllByCompany(companyId) {
		return Department.findAllByCompanyAndClosed(Company.get(companyId.toLong()),Boolean.FALSE)
    }
	
	def findAllDepartmentByCompany(companyId) {
		def result = Department.withCriteria{
						projections{
							property("id")
							property("code")
							property("name")
						}
						eq("company",Company.get(companyId.toLong()))
						eq("closed",Boolean.FALSE)
						//maxResults(100)
						order("id", "asc")
					}
		return result
	 }
}
