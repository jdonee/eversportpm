

<%@ page import="com.jdonee.Role" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <jqval:resources />
        <jqvalui:resources />
        <jqvalui:renderValidationScript for="com.jdonee.Role" not="dateCreated,lastUpdated" form="roleForm" errorClass="invalid" validClass="success" onsubmit="false"  renderErrorsOnTop="true" />
        <g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>   
    </head>
    <body>
        <h3 class="ui-widget-header"><g:message code="default.create.label" args="[entityName]" /></h3>
    	<div id="pageBody">
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <br/>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${roleInstance}">
	            <jqvalui:renderErrors style="margin-bottom:10px">
	                <g:renderErrors bean="${roleInstance}" as="list" />
	            </jqvalui:renderErrors>
            </g:hasErrors>
            <g:form action="save" name="roleForm" >
            	<g:render template="createAndEdit" />
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
        </div>
    </body>
</html>
