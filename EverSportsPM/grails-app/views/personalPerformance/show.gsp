
<%@ page import="com.jdonee.PersonalPerformance" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personalPerformance.label', default: 'PersonalPerformance')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <jq:jquery>
        	$("#personalPerformanceList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
		</jq:jquery>
    </head>
    <body>
    	<h3 class="ui-widget-header"><g:message code="default.show.label" args="[entityName]" /></h3>
        <div id="pageBody">
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <br/>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personalPerformanceInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.performance.label" default="Performance" /></td>
                            
                            <td valign="top" class="value"><g:link controller="performance" action="show" id="${personalPerformanceInstance?.performance?.id}">${personalPerformanceInstance?.performance?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.job.label" default="Job" /></td>
                            
                            <td valign="top" class="value"><g:link controller="job" action="show" id="${personalPerformanceInstance?.job?.id}">${personalPerformanceInstance?.job?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.companyRuleLevel.label" default="Company Rule Level" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personalPerformanceInstance, field: "companyRuleLevel")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.mainLevel.label" default="Main Level" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personalPerformanceInstance, field: "mainLevel")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.jobRuleScore.label" default="Job Rule Score" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personalPerformanceInstance, field: "jobRuleScore")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.kpiRuleScore.label" default="Kpi Rule Score" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personalPerformanceInstance, field: "kpiRuleScore")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.peripheralPeople.label" default="Peripheral People" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personalPerformanceInstance, field: "peripheralPeople")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.score.label" default="Score" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personalPerformanceInstance, field: "score")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.status.label" default="Status" /></td>
                            
                            <td valign="top" class="value">${personalPerformanceInstance?.status?.label?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.feedback.label" default="Feedback" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personalPerformanceInstance, field: "feedback")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.feedbackPeople.label" default="Feedback People" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personalPerformanceInstance, field: "feedbackPeople")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${personalPerformanceInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${personalPerformanceInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.companyRules.label" default="Company Rules" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${personalPerformanceInstance.companyRules}" var="c">
                                    <li><g:link controller="companyRule" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.jobRules.label" default="Job Rules" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${personalPerformanceInstance.jobRules}" var="j">
                                    <li><g:link controller="jobRule" action="show" id="${j.id}">${j?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.kpiRules.label" default="Kpi Rules" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${personalPerformanceInstance.kpiRules}" var="k">
                                    <li><g:link controller="kpiRule" action="show" id="${k.id}">${k?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${personalPerformanceInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
        </div>
    </body>
</html>
