
<%@ page import="com.jdonee.JobRuleScore" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'jobRuleScore.label', default: 'JobRuleScore')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'jobRuleScore.id.label', default: 'Id')}" />
                        
                            <th><g:message code="jobRuleScore.jobRule.label" default="Job Rule" /></th>
                        
                            <th><g:message code="jobRuleScore.job.label" default="Job" /></th>
                        
                            <g:sortableColumn property="used" title="${message(code: 'jobRuleScore.used.label', default: 'Used')}" />
                        
                            <g:sortableColumn property="score" title="${message(code: 'jobRuleScore.score.label', default: 'Score')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${jobRuleScoreInstanceList}" status="i" var="jobRuleScoreInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${jobRuleScoreInstance.id}">${fieldValue(bean: jobRuleScoreInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: jobRuleScoreInstance, field: "jobRule")}</td>
                        
                            <td>${fieldValue(bean: jobRuleScoreInstance, field: "job")}</td>
                        
                            <td><g:formatBoolean boolean="${jobRuleScoreInstance.used}" /></td>
                        
                            <td>${fieldValue(bean: jobRuleScoreInstance, field: "score")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${jobRuleScoreInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
