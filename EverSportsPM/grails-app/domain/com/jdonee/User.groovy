package com.jdonee

/**
 * 用户表
 * @author Jdonee
 *
 */
class User {

	String username
	String password
	String email //邮箱
	String employeeName //雇员姓名
	boolean enabled //是否可用
	boolean accountExpired //用户过期
	boolean accountLocked //用户锁定
	boolean passwordExpired //密码过期
	Date dateCreated
	Date lastUpdated
	
	static hasMany =[jobs: Job]
	static constraints = {
		username(blank:false, unique: true)
		password(blank:false,password:true,minSize:4)
		employeeName(nullable: true,blank:false)
		email(nullable: true,email:true)
		enabled()
		accountExpired()
		accountLocked()
		passwordExpired()
		dateCreated()
		lastUpdated()
	}

	static mapping = {
		password column: '`password`' //关键字映射
		jobs lazy: false
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}
	
	String toString(){
		"${username}[${employeeName}]"
	}
}
