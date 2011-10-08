/**
 * 
 */
package com.jdonee.utils

/**
 * @author Jdonee
 *
 */
enum PerformanceStatus {
	INIT(0,'指标初始化 '),
	INPUT_FINISHED(1,'指标输入完成'),
	SUPERIOR_AUDITING(2,'审核指标完成'),
	START_ASSESS(3,'开始员工考核'),
	PERSON_SUMMARY(4,'员工自评完成'),
	SUPERIOR_SUMMARY(5,'上级评分完成'),
	PERSON_AFFIRM(6,'员工确认完成'),
	SUPERIOR_AFFIRM(7,'上级确认完成'),
	END_ASSESS(8,'关闭员工考核')
	
	final Integer code 
	final String label 
	PerformanceStatus(Integer code, String label) {
		this.code = code
		this.label = label
	}
    Integer code() { return code }
	String  label()  { return label }
	static list(){[
		   INIT, INPUT_FINISHED, SUPERIOR_AUDITING, 
		   START_ASSESS, PERSON_SUMMARY,SUPERIOR_SUMMARY,
		   PERSON_AFFIRM,SUPERIOR_AFFIRM,END_ASSESS
		   ]}
	
}
