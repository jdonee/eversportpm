

<%@ page import="com.jdonee.Department"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'department.label', default: 'Department')}" />
<title><g:message code="default.edit.label" args="[entityName]" />
</title>
<jqval:resources />
<jqvalui:resources />
<jqvalui:renderValidationScript for="com.jdonee.Department"
	not="closed,dateCreated,lastUpdated" form="departmentForm"
	errorClass="invalid" validClass="success" onsubmit="false"
	renderErrorsOnTop="true" />
</head>
<body>
	<h3 class="ui-widget-header"><g:message code="default.edit.label" args="[entityName]" /></h3>
    	<div id="pageBody">
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <br/>
	<div class="body">
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${departmentInstance}">
			<jqvalui:renderErrors style="margin-bottom:10px">
				<g:renderErrors bean="${departmentInstance}" as="list" />
			</jqvalui:renderErrors>
		</g:hasErrors>
		<g:form method="post" name="departmentForm">
			<g:hiddenField name="id" value="${departmentInstance?.id}" />
			<g:hiddenField name="version" value="${departmentInstance?.version}" />
			<g:render template="createAndEdit" />
			<div class="buttons">
				<span class="button"><g:actionSubmit class="save"
						action="update"
						value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</span> <span class="button"><g:actionSubmit class="delete"
						action="delete"
						value="${message(code: 'default.button.delete.label', default: 'Delete')}"
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</span>
			</div>
		</g:form>
	</div>
	</div>
</body>
</html>
