package com.jdonee

import java.util.Date;
/**
 * 部门表
 * @author Jdonee
 *
 */
class Department {
	String name //部门名称
	String code  //部门编号
	Company company
	String description //描述
	Boolean closed=false //是否关闭
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [ jobs: Job ]
	static belongsTo = [company:Company]
    static constraints = {
		company()
		name(blank:false,maxSize:50)
		code(blank: false, unique: true,maxSize:50,matches:"\\d+")
		description(nullable: true,maxSize:150)
		closed()
		dateCreated()
		lastUpdated()
    }
	
	static mapping = { jobs lazy: false }
	
	String toString(){
		"${name}(${code})"
	}
}
