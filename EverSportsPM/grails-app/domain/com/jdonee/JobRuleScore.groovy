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
		score(nullable: true,min:0,max:100)
    }
	
	static void removeAll(JobRule jobRule) {
		executeUpdate 'DELETE FROM JobRuleScore WHERE jobRule=:jobRule', [jobRule: jobRule]
	}
	
	String toString(){
		"${score}"
	}
}
