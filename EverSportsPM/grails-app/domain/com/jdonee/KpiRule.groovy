package com.jdonee

import java.util.Date;

/**
 * KPI绩效表
 * @author Jdonee
 *
 */
class KpiRule  {

	String desiredItem //指标项
	String targetValue //目标值
	Integer weight //指标项权重
	String description //指标说明
	String actualValue //实际值
	Integer score //评分
	PersonalPerformance personalPerformance
	Date dateCreated
	Date lastUpdated
	static belongsTo=[personalPerformance:PersonalPerformance]
    static constraints = {
		personalPerformance()
		desiredItem(blank:false)
		targetValue()
		actualValue(nullable: true)
		weight(nullable: true,min:0,max:100)
		score(nullable: true,min:0,max:100)
		description(nullable: true)
		dateCreated()
		lastUpdated()
    }
	
	String toString(){
		"${desiredItem}, ${targetValue} (${weight})"
	}
}
