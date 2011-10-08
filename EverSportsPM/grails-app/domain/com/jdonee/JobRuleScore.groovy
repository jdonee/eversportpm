package com.jdonee

import java.util.Date;
/**
 * 岗位职责要项周边评分表
 * @author Jdonee
 *
 */
class JobRuleScore {

	Integer score //评分
	User user
	JobRule jobRule
    static belongsTo=[jobRule:JobRule,user:User]
    static constraints = {
		jobRule()
		user()
		score(blank: false,min:0,max:100)
    }
	
	String toString(){
		"${score}"
	}
}
