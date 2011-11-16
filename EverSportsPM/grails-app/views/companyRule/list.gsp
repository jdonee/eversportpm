
<%@ page import="com.jdonee.CompanyRule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'companyRule.label', default: 'CompanyRule')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'companyRule.id.label', default: 'Id')}" />
                        
                            <th><g:message code="companyRule.personalPerformance.label" default="Personal Performance" /></th>
                        
                            <g:sortableColumn property="content" title="${message(code: 'companyRule.content.label', default: 'Content')}" />
                        
                            <g:sortableColumn property="personSummary" title="${message(code: 'companyRule.personSummary.label', default: 'Person Summary')}" />
                        
                            <g:sortableColumn property="appraise" title="${message(code: 'companyRule.appraise.label', default: 'Appraise')}" />
                        
                            <g:sortableColumn property="expectation" title="${message(code: 'companyRule.expectation.label', default: 'Expectation')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${companyRuleInstanceList}" status="i" var="companyRuleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${companyRuleInstance.id}">${fieldValue(bean: companyRuleInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: companyRuleInstance, field: "personalPerformance")}</td>
                        
                            <td>${fieldValue(bean: companyRuleInstance, field: "content")}</td>
                        
                            <td>${fieldValue(bean: companyRuleInstance, field: "personSummary")}</td>
                        
                            <td>${fieldValue(bean: companyRuleInstance, field: "appraise")}</td>
                        
                            <td>${fieldValue(bean: companyRuleInstance, field: "expectation")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${companyRuleInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
