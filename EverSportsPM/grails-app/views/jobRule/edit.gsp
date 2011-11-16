

<%@ page import="com.jdonee.JobRule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'jobRule.label', default: 'JobRule')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${jobRuleInstance}">
            <div class="errors">
                <g:renderErrors bean="${jobRuleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${jobRuleInstance?.id}" />
                <g:hiddenField name="version" value="${jobRuleInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="personalPerformance"><g:message code="jobRule.personalPerformance.label" default="Personal Performance" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobRuleInstance, field: 'personalPerformance', 'errors')}">
                                    <g:select name="personalPerformance.id" from="${com.jdonee.PersonalPerformance.list()}" optionKey="id" value="${jobRuleInstance?.personalPerformance?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="jobItem"><g:message code="jobRule.jobItem.label" default="Job Item" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobRuleInstance, field: 'jobItem', 'errors')}">
                                    <g:textField name="jobItem" maxlength="150" value="${jobRuleInstance?.jobItem}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="personSummary"><g:message code="jobRule.personSummary.label" default="Person Summary" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobRuleInstance, field: 'personSummary', 'errors')}">
                                    <g:textField name="personSummary" maxlength="150" value="${jobRuleInstance?.personSummary}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="peripheralScore"><g:message code="jobRule.peripheralScore.label" default="Peripheral Score" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobRuleInstance, field: 'peripheralScore', 'errors')}">
                                    <g:textField name="peripheralScore" value="${fieldValue(bean: jobRuleInstance, field: 'peripheralScore')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="score"><g:message code="jobRule.score.label" default="Score" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobRuleInstance, field: 'score', 'errors')}">
                                    <g:textField name="score" value="${fieldValue(bean: jobRuleInstance, field: 'score')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="expectation"><g:message code="jobRule.expectation.label" default="Expectation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobRuleInstance, field: 'expectation', 'errors')}">
                                    <g:textField name="expectation" maxlength="150" value="${jobRuleInstance?.expectation}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="customed"><g:message code="jobRule.customed.label" default="Customed" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobRuleInstance, field: 'customed', 'errors')}">
                                    <g:checkBox name="customed" value="${jobRuleInstance?.customed}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="jobRuleScores"><g:message code="jobRule.jobRuleScores.label" default="Job Rule Scores" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobRuleInstance, field: 'jobRuleScores', 'errors')}">
                                    
<ul>
<g:each in="${jobRuleInstance?.jobRuleScores?}" var="j">
    <li><g:link controller="jobRuleScore" action="show" id="${j.id}">${j?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="jobRuleScore" action="create" params="['jobRule.id': jobRuleInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'jobRuleScore.label', default: 'JobRuleScore')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
