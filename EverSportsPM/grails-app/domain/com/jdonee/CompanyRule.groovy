package com.jdonee

import java.util.Date;
/**
 * 企业价值观(工作行为态度与价值观)
 * @author Jdonee
 *
 */
class CompanyRule {

	String content  //内容
	Boolean customed=true //是否自定义
	String personSummary //自我总结
	PersonalPerformance personalPerformance
	String appraise //评价
	String expectation //期望
	Date dateCreated
	Date lastUpdated
    static belongsTo=[personalPerformance:PersonalPerformance]
    static constraints = {
		personalPerformance()
		content(blank:false)
		personSummary(nullable: true)
		appraise(nullable: true)
		expectation(nullable: true)
		customed()
		dateCreated()
		lastUpdated()
    }
	
	String toString(){
		"${content}, ${personSummary} ,${appraise},${expectation}"
	}
}
