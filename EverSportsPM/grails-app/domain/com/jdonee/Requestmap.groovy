package com.jdonee

import java.util.Date;

class Requestmap {

	String url		//路径
	String description //说明
	String configAttribute //匹配权限
	Boolean customed=false //是否自定义
	Date dateCreated
	Date lastUpdated

	static mapping = {
		cache true
	}

	static constraints = {
		url blank: false, unique: true
		configAttribute blank: false
		description blank: false , unique: true,maxSize : 150
		customed blank: false
		dateCreated()
		lastUpdated()
	}
	
	String toString(){
		"${description}"
	}
}
