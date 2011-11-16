

<%@ page import="com.jdonee.CompanyRule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'companyRule.label', default: 'CompanyRule')}" />
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
            <g:hasErrors bean="${companyRuleInstance}">
            <div class="errors">
                <g:renderErrors bean="${companyRuleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${companyRuleInstance?.id}" />
                <g:hiddenField name="version" value="${companyRuleInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="personalPerformance"><g:message code="companyRule.personalPerformance.label" default="Personal Performance" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyRuleInstance, field: 'personalPerformance', 'errors')}">
                                    <g:select name="personalPerformance.id" from="${com.jdonee.PersonalPerformance.list()}" optionKey="id" value="${companyRuleInstance?.personalPerformance?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="content"><g:message code="companyRule.content.label" default="Content" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyRuleInstance, field: 'content', 'errors')}">
                                    <g:textField name="content" maxlength="150" value="${companyRuleInstance?.content}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="personSummary"><g:message code="companyRule.personSummary.label" default="Person Summary" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyRuleInstance, field: 'personSummary', 'errors')}">
                                    <g:textField name="personSummary" maxlength="150" value="${companyRuleInstance?.personSummary}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="appraise"><g:message code="companyRule.appraise.label" default="Appraise" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyRuleInstance, field: 'appraise', 'errors')}">
                                    <g:textField name="appraise" maxlength="150" value="${companyRuleInstance?.appraise}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="expectation"><g:message code="companyRule.expectation.label" default="Expectation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyRuleInstance, field: 'expectation', 'errors')}">
                                    <g:textField name="expectation" maxlength="150" value="${companyRuleInstance?.expectation}" />
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
