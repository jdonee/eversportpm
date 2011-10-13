

<%@ page import="com.jdonee.PersonalPerformance" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personalPerformance.label', default: 'PersonalPerformance')}" />
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
            <g:hasErrors bean="${personalPerformanceInstance}">
            <div class="errors">
                <g:renderErrors bean="${personalPerformanceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${personalPerformanceInstance?.id}" />
                <g:hiddenField name="version" value="${personalPerformanceInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="performance"><g:message code="personalPerformance.performance.label" default="Performance" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'performance', 'errors')}">
                                    <g:select name="performance.id" from="${com.jdonee.Performance.list()}" optionKey="id" value="${personalPerformanceInstance?.performance?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="job"><g:message code="personalPerformance.job.label" default="Job" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'job', 'errors')}">
                                    <g:select name="job.id" from="${com.jdonee.Job.list()}" optionKey="id" value="${personalPerformanceInstance?.job?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="companyRuleLevel"><g:message code="personalPerformance.companyRuleLevel.label" default="Company Rule Level" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'companyRuleLevel', 'errors')}">
                                    <g:textField name="companyRuleLevel" maxlength="2" value="${personalPerformanceInstance?.companyRuleLevel}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="mainLevel"><g:message code="personalPerformance.mainLevel.label" default="Main Level" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'mainLevel', 'errors')}">
                                    <g:textField name="mainLevel" maxlength="2" value="${personalPerformanceInstance?.mainLevel}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="jobRuleScore"><g:message code="personalPerformance.jobRuleScore.label" default="Job Rule Score" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'jobRuleScore', 'errors')}">
                                    <g:textField name="jobRuleScore" value="${fieldValue(bean: personalPerformanceInstance, field: 'jobRuleScore')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="kpiRuleScore"><g:message code="personalPerformance.kpiRuleScore.label" default="Kpi Rule Score" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'kpiRuleScore', 'errors')}">
                                    <g:textField name="kpiRuleScore" value="${fieldValue(bean: personalPerformanceInstance, field: 'kpiRuleScore')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="peripheralPeople"><g:message code="personalPerformance.peripheralPeople.label" default="Peripheral People" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'peripheralPeople', 'errors')}">
                                    <g:textField name="peripheralPeople" maxlength="100" value="${personalPerformanceInstance?.peripheralPeople}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="score"><g:message code="personalPerformance.score.label" default="Score" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'score', 'errors')}">
                                    <g:textField name="score" value="${fieldValue(bean: personalPerformanceInstance, field: 'score')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="status"><g:message code="personalPerformance.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'status', 'errors')}">
                                    <g:select name="status" from="${com.jdonee.utils.PerformanceStatus?.values()}" keys="${com.jdonee.utils.PerformanceStatus?.values()*.name()}" value="${personalPerformanceInstance?.status?.name()}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="feedback"><g:message code="personalPerformance.feedback.label" default="Feedback" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'feedback', 'errors')}">
                                    <g:textField name="feedback" maxlength="200" value="${personalPerformanceInstance?.feedback}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="feedbackPeople"><g:message code="personalPerformance.feedbackPeople.label" default="Feedback People" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'feedbackPeople', 'errors')}">
                                    <g:textField name="feedbackPeople" maxlength="20" value="${personalPerformanceInstance?.feedbackPeople}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="companyRules"><g:message code="personalPerformance.companyRules.label" default="Company Rules" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'companyRules', 'errors')}">
                                    
<ul>
<g:each in="${personalPerformanceInstance?.companyRules?}" var="c">
    <li><g:link controller="companyRule" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="companyRule" action="create" params="['personalPerformance.id': personalPerformanceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'companyRule.label', default: 'CompanyRule')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="jobRules"><g:message code="personalPerformance.jobRules.label" default="Job Rules" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'jobRules', 'errors')}">
                                    
<ul>
<g:each in="${personalPerformanceInstance?.jobRules?}" var="j">
    <li><g:link controller="jobRule" action="show" id="${j.id}">${j?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="jobRule" action="create" params="['personalPerformance.id': personalPerformanceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'jobRule.label', default: 'JobRule')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="kpiRules"><g:message code="personalPerformance.kpiRules.label" default="Kpi Rules" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'kpiRules', 'errors')}">
                                    
<ul>
<g:each in="${personalPerformanceInstance?.kpiRules?}" var="k">
    <li><g:link controller="kpiRule" action="show" id="${k.id}">${k?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="kpiRule" action="create" params="['personalPerformance.id': personalPerformanceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'kpiRule.label', default: 'KpiRule')])}</g:link>

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
