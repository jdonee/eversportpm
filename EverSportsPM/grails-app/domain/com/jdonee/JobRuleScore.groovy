package com.jdonee

import java.util.Date;
/**
 * 岗位职责要项周边评分表
 * @author Jdonee
 *
 */
class JobRuleScore {

	Integer score //评分
	Job job
	JobRule jobRule
	Boolean used=false //是否评价过
    static belongsTo=[jobRule:JobRule,job:Job]
    static constraints = {
		jobRule()
		job()
		used()
		score(blank: false,min:0,max:100)
    }
	
	String toString(){
		"${score}"
	}
}
