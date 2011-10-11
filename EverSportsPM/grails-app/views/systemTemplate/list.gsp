
<%@ page import="com.jdonee.SystemTemplate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'systemTemplate.label', default: 'SystemTemplate')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <h3 class="ui-widget-header"><g:message code="default.list.label" args="[entityName]" /></h3>
    	<div id="pageBody">
        <div class="nav">
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <br/>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'systemTemplate.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="templateType" title="${message(code: 'systemTemplate.templateType.label', default: 'Template Type')}" />
                        
                            <g:sortableColumn property="templateContent" title="${message(code: 'systemTemplate.templateContent.label', default: 'Template Content')}" />
                        
                            <g:sortableColumn property="enabled" title="${message(code: 'systemTemplate.enabled.label', default: 'Enabled')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'systemTemplate.dateCreated.label', default: 'Date Created')}" />
                            
                            <th class="sortable" style="font-size:10px;">${message(code: 'default.operater.label', default: 'Operater')}</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${systemTemplateInstanceList}" status="i" var="systemTemplateInstance">
                        <tr class="${(i % 2) == 0 ? 'clickableOdd' : 'clickableEven'}">
                        
                            <td>${fieldValue(bean: systemTemplateInstance, field: "id")}</td>
                        
                            <td>${fieldValue(bean: systemTemplateInstance, field: "templateType")}</td>
                        
                            <td class="contents">${systemTemplateInstance?.templateContentBy?.encodeAsHTML()}</td>
                        
                            <td><g:formatBoolean boolean="${systemTemplateInstance.enabled}"/></td>
                        
                            <td><g:formatDate date="${systemTemplateInstance.dateCreated}"/></td>
                            
                            <td class="notClickable">
                                    <g:link action="show" id="${systemTemplateInstance.id}">
                                        <img  src="${resource(dir:'images/skin',file:'database_go.png')}" alt="${message(code: 'default.button.show.label', default: 'Show')}" />
                                    </g:link>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${systemTemplateInstanceTotal}" />
            </div>
        </div>
        </div>
    </body>
</html>
