
<%@ page import="com.jdonee.Performance" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'performance.label', default: 'Performance')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'performance.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'performance.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="startDate" title="${message(code: 'performance.startDate.label', default: 'Start Date')}" />
                        
                            <g:sortableColumn property="endDate" title="${message(code: 'performance.endDate.label', default: 'End Date')}" />
                        
                            <g:sortableColumn property="mainWeight" title="${message(code: 'performance.mainWeight.label', default: 'Main Weight')}" />
                        
                            <g:sortableColumn property="auxiliaryWeight" title="${message(code: 'performance.auxiliaryWeight.label', default: 'Auxiliary Weight')}" />
                            
                            <g:sortableColumn property="peripheralWeight" title="${message(code: 'performance.peripheralWeight.label', default: 'Peripheral Weight')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'performance.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'performance.lastUpdated.label', default: 'Last Updated')}" />
                            
                            <th class="sortable" style="font-size:10px;">${message(code: 'default.operater.label', default: 'Operater')}</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${performanceInstanceList}" status="i" var="performanceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: performanceInstance, field: "id")}</td>
                        
                            <td>${fieldValue(bean: performanceInstance, field: "name")}</td>
                        
                            <td><g:formatDate date="${performanceInstance.startDate}" format="yyyy-MM-dd"/></td>
                        
                            <td><g:formatDate date="${performanceInstance.endDate}" format="yyyy-MM-dd"/></td>
                        
                            <td>${fieldValue(bean: performanceInstance, field: "mainWeight")}</td>
                        
                            <td>${fieldValue(bean: performanceInstance, field: "auxiliaryWeight")}</td> 
                            
                            <td>${fieldValue(bean: performanceInstance, field: "peripheralWeight")}</td>              
                                         
                        
                            <td><g:formatDate date="${performanceInstance.dateCreated}"/></td>
                        
                            <td><g:formatDate date="${performanceInstance.lastUpdated}"/></td>
                            
                            <td><g:link action="show" id="${performanceInstance.id}">${message(code: 'default.button.show.label', default: 'Show')}</g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${performanceInstanceTotal}" />
            </div>
        </div>
        </div>
    </body>
</html>
