
<%@ page import="com.jdonee.KpiRule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'kpiRule.label', default: 'KpiRule')}" />
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
                            <td valign="top" class="name"><g:message code="kpiRule.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: kpiRuleInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="kpiRule.personalPerformance.label" default="Personal Performance" /></td>
                            
                            <td valign="top" class="value"><g:link controller="personalPerformance" action="show" id="${kpiRuleInstance?.personalPerformance?.id}">${kpiRuleInstance?.personalPerformance?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="kpiRule.desiredItem.label" default="Desired Item" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: kpiRuleInstance, field: "desiredItem")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="kpiRule.targetValue.label" default="Target Value" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: kpiRuleInstance, field: "targetValue")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="kpiRule.actualValue.label" default="Actual Value" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: kpiRuleInstance, field: "actualValue")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="kpiRule.weight.label" default="Weight" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: kpiRuleInstance, field: "weight")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="kpiRule.score.label" default="Score" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: kpiRuleInstance, field: "score")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="kpiRule.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: kpiRuleInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="kpiRule.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${kpiRuleInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="kpiRule.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${kpiRuleInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${kpiRuleInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
