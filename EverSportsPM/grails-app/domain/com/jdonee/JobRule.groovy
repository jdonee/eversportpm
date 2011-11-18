package com.jdonee

import java.util.Date;
/**
 * 岗位职责要项表
 * @author Jdonee
 *
 */
class JobRule {

	String jobItem //尽职要项
	String personSummary //自我评价
	PersonalPerformance personalPerformance
	Integer score //领导评分
	Integer peripheralScore //周边评分(平均分)
	String expectation //下期期望
	Boolean customed=true //是否自定义
	Date dateCreated
	Date lastUpdated
	static  hasMany = [ jobRuleScores: JobRuleScore]
    static belongsTo=[personalPerformance:PersonalPerformance]
    static constraints = {
		personalPerformance()
		jobItem(blank:false)
		personSummary(nullable: true)
		peripheralScore(nullable: true,min:0,max:100)
		score(nullable: true,min:0,max:100)
		expectation(nullable: true)
		customed()
		dateCreated()
		lastUpdated()
    }
	
	static mapping = { jobRuleScores lazy: false }
	
	String toString(){
		"${jobItem}"
	}
}
