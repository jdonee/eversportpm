
<%@ page import="com.jdonee.JobRule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'jobRule.label', default: 'JobRule')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobRule.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: jobRuleInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobRule.personalPerformance.label" default="Personal Performance" /></td>
                            
                            <td valign="top" class="value"><g:link controller="personalPerformance" action="show" id="${jobRuleInstance?.personalPerformance?.id}">${jobRuleInstance?.personalPerformance?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobRule.jobItem.label" default="Job Item" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: jobRuleInstance, field: "jobItem")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobRule.personSummary.label" default="Person Summary" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: jobRuleInstance, field: "personSummary")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobRule.peripheralScore.label" default="Peripheral Score" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: jobRuleInstance, field: "peripheralScore")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobRule.score.label" default="Score" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: jobRuleInstance, field: "score")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobRule.expectation.label" default="Expectation" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: jobRuleInstance, field: "expectation")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobRule.customed.label" default="Customed" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${jobRuleInstance?.customed}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobRule.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${jobRuleInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobRule.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${jobRuleInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobRule.jobRuleScores.label" default="Job Rule Scores" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${jobRuleInstance.jobRuleScores}" var="j">
                                    <li><g:link controller="jobRuleScore" action="show" id="${j.id}">${j?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${jobRuleInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
