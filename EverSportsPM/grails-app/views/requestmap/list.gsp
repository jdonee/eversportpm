
<%@ page import="com.jdonee.Requestmap" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'requestmap.label', default: 'Requestmap')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'requestmap.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="url" title="${message(code: 'requestmap.url.label', default: 'Url')}" />
                        
                            <g:sortableColumn property="configAttribute" title="${message(code: 'requestmap.configAttribute.label', default: 'Config Attribute')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'requestmap.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="customed" title="${message(code: 'requestmap.customed.label', default: 'Customed')}" />
                            
                            <g:sortableColumn property="dateCreated" title="${message(code: 'scoreLevel.dateCreated.label', default: 'Date Created')}" />
                        
                            <th class="sortable" style="font-size:10px;">${message(code: 'default.operater.label', default: 'Operater')}</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${requestmapInstanceList}" status="i" var="requestmapInstance">
                        <tr class="${(i % 2) == 0 ? 'clickableOdd' : 'clickableEven'}">
                        
                        	<td>${fieldValue(bean: requestmapInstance, field: "id")}</td>
                        
                            <td>${fieldValue(bean: requestmapInstance, field: "url")}</td>
                        
                            <td>${fieldValue(bean: requestmapInstance, field: "configAttribute")}</td>
                        
                            <td>${fieldValue(bean: requestmapInstance, field: "description")}</td>
                        
                            <td><g:formatBoolean boolean="${requestmapInstance.customed}" /></td>
                        
                        	<td><g:formatDate date="${requestmapInstance.dateCreated}" /></td>
                            
                            <td class="notClickable">
                                    <g:link action="show" id="${requestmapInstance.id}">
                                        <img  src="${resource(dir:'images/skin',file:'database_go.png')}" alt="${message(code: 'default.button.show.label', default: 'Show')}" />
                                    </g:link>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${requestmapInstanceTotal}" />
            </div>
        </div>
       </div>
    </body>
</html>
