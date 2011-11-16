
<%@ page import="com.jdonee.KpiRule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'kpiRule.label', default: 'KpiRule')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'kpiRule.id.label', default: 'Id')}" />
                        
                            <th><g:message code="kpiRule.personalPerformance.label" default="Personal Performance" /></th>
                        
                            <g:sortableColumn property="desiredItem" title="${message(code: 'kpiRule.desiredItem.label', default: 'Desired Item')}" />
                        
                            <g:sortableColumn property="targetValue" title="${message(code: 'kpiRule.targetValue.label', default: 'Target Value')}" />
                        
                            <g:sortableColumn property="actualValue" title="${message(code: 'kpiRule.actualValue.label', default: 'Actual Value')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'kpiRule.weight.label', default: 'Weight')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${kpiRuleInstanceList}" status="i" var="kpiRuleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${kpiRuleInstance.id}">${fieldValue(bean: kpiRuleInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: kpiRuleInstance, field: "personalPerformance")}</td>
                        
                            <td>${fieldValue(bean: kpiRuleInstance, field: "desiredItem")}</td>
                        
                            <td>${fieldValue(bean: kpiRuleInstance, field: "targetValue")}</td>
                        
                            <td>${fieldValue(bean: kpiRuleInstance, field: "actualValue")}</td>
                        
                            <td>${fieldValue(bean: kpiRuleInstance, field: "weight")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${kpiRuleInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
