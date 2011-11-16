
<%@ page import="com.jdonee.JobRule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'jobRule.label', default: 'JobRule')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'jobRule.id.label', default: 'Id')}" />
                        
                            <th><g:message code="jobRule.personalPerformance.label" default="Personal Performance" /></th>
                        
                            <g:sortableColumn property="jobItem" title="${message(code: 'jobRule.jobItem.label', default: 'Job Item')}" />
                        
                            <g:sortableColumn property="personSummary" title="${message(code: 'jobRule.personSummary.label', default: 'Person Summary')}" />
                        
                            <g:sortableColumn property="peripheralScore" title="${message(code: 'jobRule.peripheralScore.label', default: 'Peripheral Score')}" />
                        
                            <g:sortableColumn property="score" title="${message(code: 'jobRule.score.label', default: 'Score')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${jobRuleInstanceList}" status="i" var="jobRuleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${jobRuleInstance.id}">${fieldValue(bean: jobRuleInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: jobRuleInstance, field: "personalPerformance")}</td>
                        
                            <td>${fieldValue(bean: jobRuleInstance, field: "jobItem")}</td>
                        
                            <td>${fieldValue(bean: jobRuleInstance, field: "personSummary")}</td>
                        
                            <td>${fieldValue(bean: jobRuleInstance, field: "peripheralScore")}</td>
                        
                            <td>${fieldValue(bean: jobRuleInstance, field: "score")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${jobRuleInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
