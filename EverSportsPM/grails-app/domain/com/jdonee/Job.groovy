package com.jdonee

import java.util.Date;
/**
 * 岗位表
 * @author Jdonee
 *
 */
class Job {
	String name //岗位名称
	String code  //岗位编号
	User user
	JobType jobType
	String parentCode //考评上级岗位编号
	Company company
	Department department
	String description //描述
	Boolean companyResponsible=false //是否公司负责人
	Boolean closed=false //是否关闭
	Date dateCreated
	Date lastUpdated
	
    static belongsTo = [user:User,department:Department,jobType:JobType]
    static constraints = {
		company(blank:false)
		department(blank:false)
		user(blank:false)
		name(blank:false,maxSize:50)
		code(blank:false,unique:true,maxSize:50,matches:"\\d+")
		parentCode(nullable: true,matches:"\\d+")
		jobType()
		description(nullable: true,maxSize:150)
		companyResponsible()
		closed()
		dateCreated()
		lastUpdated()
    }
	
	String toString(){
		"${name}(${jobType.name})[${user}]"
	}
}
