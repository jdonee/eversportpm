
<%@ page import="com.jdonee.Role" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div title="<g:message code="default.list.label" args="[entityName]" />" iconCls="icon-reload" closable="true">
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'role.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="authority" title="${message(code: 'role.authority.label', default: 'Authority')}" />
                            
                            <g:sortableColumn property="alias" title="${message(code: 'role.alias.label', default: 'Alias')}" />
                            
                            <g:sortableColumn property="dateCreated" title="${message(code: 'role.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'role.lastUpdated.label', default: 'Last Updated')}" />
                            
                            <th class="sortable" style="font-size:10px;">${message(code: 'default.operater.label', default: 'Operater')}</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${roleInstanceList}" status="i" var="roleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: roleInstance, field: "id")}</td>
                        
                            <td>${fieldValue(bean: roleInstance, field: "authority")}</td>
                            
                            <td>${fieldValue(bean: roleInstance, field: "alias")}</td>
                        
                            <td><g:formatDate date="${roleInstance.dateCreated}"/></td>
                        
                            <td><g:formatDate date="${roleInstance.lastUpdated}"/></td>
                            
                            <td><g:link action="show" id="${roleInstance.id}">${message(code: 'default.button.show.label', default: 'Show')}</g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${roleInstanceTotal}" />
            </div>
            </div>
        </div>
    </body>
</html>
