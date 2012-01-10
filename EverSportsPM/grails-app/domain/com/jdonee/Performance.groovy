package com.jdonee

import java.util.Date;
import com.jdonee.utils.Constants;
/**
 * 绩效考核表
 * @author Jdonee
 *
 */
class Performance  {
	String name  //考核名称
	Date startDate //开始日期
	Date endDate //结束日期
	Integer mainWeight //KPI权重
	Integer auxiliaryWeight //岗位职责权重
	Integer peripheralWeight //岗位职责周边评价权重
	String description //描述
	Boolean closed=false //是否关闭
	Boolean useTemplate=false //是否使用岗位职责和企业价值观模板
	Date dateCreated
	Date lastUpdated

	static transients=['justiceWeight']
	boolean isJusticeWeight(){
		return mainWeight+auxiliaryWeight == Constants.TOTAL_SCORE
	}
	static hasMany = [personalPerformances:PersonalPerformance]
	static constraints = {
		name(blank:false,maxSize:50)
		startDate()
		endDate()
		mainWeight(min:0,max:100)
		auxiliaryWeight(min:0,max:100)
		peripheralWeight(min:0,max:100)
		description(nullable:true,maxSize:150)
		closed()
		useTemplate()
		dateCreated()
		lastUpdated()
	}

	static mapping = { personalPerformances lazy: false }
	
	String toString(){
		//return "${name}, ${startDate.format('MM/dd/yyyy')}"
		return "${name}[${String.format('%tm/%<td/%<tY',startDate)}-${String.format('%tm/%<td/%<tY',endDate)}]" //从Groovy1.7开始的新特性[http://groovy.codehaus.org/JN0545-Dates]
	}
}
