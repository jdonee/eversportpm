package com.jdonee

import java.util.Date;
/**
 * 岗位类型(工种)表
 * @author Jdonee
 *
 */
class JobType {

	String name //类型名称
	String description //描述
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		name(blank:false)
		description(nullable: true,maxSize:150)
		dateCreated()
		lastUpdated()
	}
	
	String toString(){
		"${name}"
	}
}
