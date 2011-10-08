package com.jdonee

/**
 * 公司表
 * @author Jdonee
 *
 */
class Company {

	String name //公司名
	String code  //公司编号
	String description //描述
	Boolean closed=false //是否关闭
	Date dateCreated
	Date lastUpdated

	static hasMany = [ departments: Department ]
	
	static searchFields = {
		name
		code
		closed(inList:[true,false])
	}

	static constraints = {
		name(blank: false, unique: true,maxSize:50)
		code(blank: false, unique: true,maxSize:50,matches:"\\d+")
		description(nullable: true,maxSize:150)
		closed()
		dateCreated()
		lastUpdated()
	}

	static mapping = { departments lazy: false }

	String toString(){
		"${name}[${code}]"
	}
}
