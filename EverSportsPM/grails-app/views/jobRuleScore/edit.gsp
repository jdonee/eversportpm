

<%@ page import="com.jdonee.JobRuleScore" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'jobRuleScore.label', default: 'JobRuleScore')}" />
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
            <g:hasErrors bean="${jobRuleScoreInstance}">
            <div class="errors">
                <g:renderErrors bean="${jobRuleScoreInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${jobRuleScoreInstance?.id}" />
                <g:hiddenField name="version" value="${jobRuleScoreInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="jobRule"><g:message code="jobRuleScore.jobRule.label" default="Job Rule" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobRuleScoreInstance, field: 'jobRule', 'errors')}">
                                    <g:select name="jobRule.id" from="${com.jdonee.JobRule.list()}" optionKey="id" value="${jobRuleScoreInstance?.jobRule?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="job"><g:message code="jobRuleScore.job.label" default="Job" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobRuleScoreInstance, field: 'job', 'errors')}">
                                    <g:select name="job.id" from="${com.jdonee.Job.list()}" optionKey="id" value="${jobRuleScoreInstance?.job?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="used"><g:message code="jobRuleScore.used.label" default="Used" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobRuleScoreInstance, field: 'used', 'errors')}">
                                    <g:checkBox name="used" value="${jobRuleScoreInstance?.used}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="score"><g:message code="jobRuleScore.score.label" default="Score" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobRuleScoreInstance, field: 'score', 'errors')}">
                                    <g:textField name="score" value="${fieldValue(bean: jobRuleScoreInstance, field: 'score')}" />
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
