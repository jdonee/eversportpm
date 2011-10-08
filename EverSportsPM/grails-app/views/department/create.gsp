

<%@ page import="com.jdonee.Department" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'department.label', default: 'Department')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <jqval:resources />
        <jqvalui:resources />
        <jqvalui:renderValidationScript for="com.jdonee.Department" not="closed,dateCreated,lastUpdated" form="departmentForm" errorClass="invalid" validClass="success" onsubmit="false"  renderErrorsOnTop="true" />
    </head>
    <body>
        <div title="<g:message code="default.create.label" args="[entityName]" />" closable="true">
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <br/>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${departmentInstance}">
                <jqvalui:renderErrors style="margin-bottom:10px">
	                <g:renderErrors bean="${departmentInstance}" as="list" />
	            </jqvalui:renderErrors>
            </g:hasErrors>
            <g:form action="save" name="departmentForm">
                <g:render template="createAndEdit" />
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
        </div>
    </body>
</html>
