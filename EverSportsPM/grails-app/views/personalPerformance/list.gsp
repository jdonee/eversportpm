
<%@ page import="com.jdonee.PersonalPerformance" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personalPerformance.label', default: 'PersonalPerformance')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'personalPerformance.id.label', default: 'Id')}" />
                        
                            <th><g:message code="personalPerformance.performance.label" default="Performance" /></th>
                        
                            <th><g:message code="personalPerformance.job.label" default="Job" /></th>
                        
                            <g:sortableColumn property="companyRuleLevel" title="${message(code: 'personalPerformance.companyRuleLevel.label', default: 'Company Rule Level')}" />
                        
                            <g:sortableColumn property="mainLevel" title="${message(code: 'personalPerformance.mainLevel.label', default: 'Main Level')}" />
                        
                            <g:sortableColumn property="jobRuleScore" title="${message(code: 'personalPerformance.jobRuleScore.label', default: 'Job Rule Score')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${personalPerformanceInstanceList}" status="i" var="personalPerformanceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${personalPerformanceInstance.id}">${fieldValue(bean: personalPerformanceInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: personalPerformanceInstance, field: "performance")}</td>
                        
                            <td>${fieldValue(bean: personalPerformanceInstance, field: "job")}</td>
                        
                            <td>${fieldValue(bean: personalPerformanceInstance, field: "companyRuleLevel")}</td>
                        
                            <td>${fieldValue(bean: personalPerformanceInstance, field: "mainLevel")}</td>
                        
                            <td>${fieldValue(bean: personalPerformanceInstance, field: "jobRuleScore")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${personalPerformanceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
