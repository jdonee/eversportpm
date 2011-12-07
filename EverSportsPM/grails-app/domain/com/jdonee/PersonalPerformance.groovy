package com.jdonee

import com.jdonee.utils.PerformanceStatus
import java.util.Date;
/**
 * 岗位绩效考核表
 * @author Jdonee
 *
 */
class PersonalPerformance  {
	Performance performance
	Job job
	String companyRuleLevel //企业价值观等级
	String mainLevel //KPI和岗位职责要项等级
	Integer jobRuleScore=0 //岗位职责要项分数
	Integer kpiRuleScore=0 //KPI分数
	Integer score=0 //KPI和岗位职责要项分数
	String feedback //领导反馈
	String feedbackPeople //反馈人
	String peripheralPeople //周边评价岗位列表,多个使用逗号分隔
	PerformanceStatus status=PerformanceStatus.INIT
	Date dateCreated
	Date lastUpdated
	static hasMany =[jobRules: JobRule, companyRules:CompanyRule,kpiRules:KpiRule]
	static belongsTo = [job:Job,performance:Performance]
	static constraints = {
		performance()
		job()
		companyRuleLevel(nullable: true,maxSize:2)
		mainLevel(nullable: true,maxSize:2)
		jobRuleScore(nullable: true,min:0,max:100)
		kpiRuleScore(nullable: true,min:0,max:100)
		peripheralPeople(nullable: true,maxSize:100)
		score(nullable: true,min:0,max:100)
		status()
		feedback(nullable: true,maxSize:200)
		feedbackPeople(nullable: true,maxSize:20)
		dateCreated()
		lastUpdated()
	}

	static mapping = {
		jobRules lazy: false
		companyRules lazy: false
		kpiRules lazy: false
	}

	static PersonalPerformance get(Long jobId, Long performanceId) {
		find 'from PersonalPerformance where job.id=:jobId and performance.id=:performanceId',
				[jobId: jobId, performanceId: performanceId]
	}

	String toString(){
		"岗位信息:${job},考核周期:${performance},状态:${status.label}"
	}
}
