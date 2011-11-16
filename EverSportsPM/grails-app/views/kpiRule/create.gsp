

<%@ page import="com.jdonee.KpiRule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'kpiRule.label', default: 'KpiRule')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${kpiRuleInstance}">
            <div class="errors">
                <g:renderErrors bean="${kpiRuleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="personalPerformance"><g:message code="kpiRule.personalPerformance.label" default="Personal Performance" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: kpiRuleInstance, field: 'personalPerformance', 'errors')}">
                                    <g:select name="personalPerformance.id" from="${com.jdonee.PersonalPerformance.list()}" optionKey="id" value="${kpiRuleInstance?.personalPerformance?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="desiredItem"><g:message code="kpiRule.desiredItem.label" default="Desired Item" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: kpiRuleInstance, field: 'desiredItem', 'errors')}">
                                    <g:textField name="desiredItem" maxlength="150" value="${kpiRuleInstance?.desiredItem}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="targetValue"><g:message code="kpiRule.targetValue.label" default="Target Value" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: kpiRuleInstance, field: 'targetValue', 'errors')}">
                                    <g:textField name="targetValue" value="${fieldValue(bean: kpiRuleInstance, field: 'targetValue')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="actualValue"><g:message code="kpiRule.actualValue.label" default="Actual Value" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: kpiRuleInstance, field: 'actualValue', 'errors')}">
                                    <g:textField name="actualValue" value="${fieldValue(bean: kpiRuleInstance, field: 'actualValue')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="weight"><g:message code="kpiRule.weight.label" default="Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: kpiRuleInstance, field: 'weight', 'errors')}">
                                    <g:textField name="weight" value="${fieldValue(bean: kpiRuleInstance, field: 'weight')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="score"><g:message code="kpiRule.score.label" default="Score" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: kpiRuleInstance, field: 'score', 'errors')}">
                                    <g:textField name="score" value="${fieldValue(bean: kpiRuleInstance, field: 'score')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="kpiRule.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: kpiRuleInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" maxlength="250" value="${kpiRuleInstance?.description}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
