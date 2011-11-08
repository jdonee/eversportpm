/**
 * 
 */
package com.jdonee.utils

/**
 * @author Jdonee
 *
 */
enum TemplateType {
	//KPI('KPI指标项'),
	JOB('岗位尽职要项'),
	COMPANY('工作行为态度与价值观')
	
	final String label 
	TemplateType(String label) {
		this.label = label
	}
	String  label()  { return label }
	//static list(){[KPI,JOB,COMPANY]}
	static list(){[JOB,COMPANY]}
	String toString(){
		"${label}"
	}
}
