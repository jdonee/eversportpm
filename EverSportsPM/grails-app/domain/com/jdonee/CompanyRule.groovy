package com.jdonee

import java.util.Date;
/**
 * 企业价值观(工作行为态度与价值观)
 * @author Jdonee
 *
 */
class CompanyRule {

	String content  //内容
	String personSummary //自我总结
	PersonalPerformance personalPerformance
	String appraise //评价
	String expectation //期望
	Date dateCreated
	Date lastUpdated
    static belongsTo=[personalPerformance:PersonalPerformance]
    static constraints = {
		personalPerformance()
		content(blank:false,maxSize:150)
		personSummary(nullable: true,maxSize:150)
		appraise(nullable: true,maxSize:150)
		expectation(nullable: true,maxSize:150)
		dateCreated()
		lastUpdated()
    }
	
	String toString(){
		"${content}, ${personSummary} ,${appraise},${expectation}"
	}
}
