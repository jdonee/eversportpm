package com.jdonee

import java.util.Date;
/**
 * 统计规则
 * @author Jdonee
 *
 */
class ScoreLevel{
	
	String level //等级
	Integer minValue   //最小值
	Integer maxValue   //最大值
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		level(blank: false, unique: true,maxSize:2,matches:'[A-Z]')
		minValue(min:0,max:100)
		maxValue(min:0,max:100)
		dateCreated()
		lastUpdated()
    }
	
	String toString(){
		"${level}, ${minValue} (${maxValue})"
	}
	
}
