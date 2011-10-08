package com.jdonee
/**
 * 角色表
 * @author Jdonee
 *
 */
class Role {

	String authority //权限名称
	String alias //别名
	String description //描述
	Date dateCreated
	Date lastUpdated
	
	static transients=['admin']
	
	boolean isAdmin(){
		return authority == "ROLE_ADMIN"
	}

	static mapping = {
		alias column: '`alias`' //关键字映射
		cache true
	}

	static constraints = {
		authority(blank: false, unique: true,matches:"^ROLE_[A-Z]+\$")
		alias(blank: false, unique: true)
		description(maxSize:100,nullable: true)
		dateCreated()
		lastUpdated()
	}
	
	String toString(){
		"${alias}"
	}
}
