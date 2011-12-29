package com.jdonee

import com.jdonee.utils.TemplateType
import java.util.Date
import com.jdonee.utils.Constants

/**
 * 系统模板定义
 * @author Jdonee
 *
 */
class SystemTemplate {
	
	TemplateType templateType
	String templateContent   //多条记录使用||符号进行分割
	Boolean enabled //是否可用
	Date dateCreated
	Date lastUpdated
	static transients =['templateContentBy']
    static constraints = {
		templateType(blank: false)
		templateContent(blank: false)
		enabled()
		dateCreated()
		lastUpdated()
    }
	
	String getTemplateContentBy(){
		def temps="${templateContent}".tokenize(Constants.DEFAULT_SEPARATOR)
		StringBuilder sb=new StringBuilder();
		if(temps.size()>0){
			temps.each{ value -> sb.append(value).append(System.getProperty("line.separator"))}
		}else{
			sb.append("${templateContent}").append(System.getProperty("line.separator"))
		}
	  sb.toString()
	}
	
}
