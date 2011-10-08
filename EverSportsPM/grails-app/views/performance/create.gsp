

<%@ page import="com.jdonee.Performance" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'performance.label', default: 'Performance')}" />
        <jqval:resources />
        <jqvalui:resources />
        <jqui:resourceLink plugin="jqueryUi" type="js" dir="js/jquery/i18n" file="jquery.ui.datepicker-zh-CN.js"/>
        <jqvalui:renderValidationScript for="com.jdonee.Performance" not="useTemplate,closed,dateCreated,lastUpdated" form="performanceForm" errorClass="invalid" validClass="success" onsubmit="false"  renderErrorsOnTop="true" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
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
            <g:hasErrors bean="${performanceInstance}">
            <jqvalui:renderErrors style="margin-bottom:10px">
	                <g:renderErrors bean="${performanceInstance}" as="list" />
	            </jqvalui:renderErrors>
            </g:hasErrors>
            <g:form action="save" name="performanceForm">
                <g:render template="createAndEdit" />
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
            </div>
        </div>
    </body>
</html>
