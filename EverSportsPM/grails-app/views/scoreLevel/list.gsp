
<%@ page import="com.jdonee.ScoreLevel" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'scoreLevel.label', default: 'ScoreLevel')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'scoreLevel.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="level" title="${message(code: 'scoreLevel.level.label', default: 'Level')}" />
                        
                            <g:sortableColumn property="minValue" title="${message(code: 'scoreLevel.minValue.label', default: 'Min Value')}" />
                        
                            <g:sortableColumn property="maxValue" title="${message(code: 'scoreLevel.maxValue.label', default: 'Max Value')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'scoreLevel.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'scoreLevel.lastUpdated.label', default: 'Last Updated')}" />
                            
                            <th class="sortable" style="font-size:10px;">${message(code: 'default.operater.label', default: 'Operater')}</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${scoreLevelInstanceList}" status="i" var="scoreLevelInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: scoreLevelInstance, field: "id")}</td>
                        
                            <td>${fieldValue(bean: scoreLevelInstance, field: "level")}</td>
                        
                            <td>${fieldValue(bean: scoreLevelInstance, field: "minValue")}</td>
                        
                            <td>${fieldValue(bean: scoreLevelInstance, field: "maxValue")}</td>
                        
                            <td><g:formatDate date="${scoreLevelInstance.dateCreated}" /></td>
                        
                            <td><g:formatDate date="${scoreLevelInstance.lastUpdated}" /></td>
                            
                            <td><g:link action="show" id="${scoreLevelInstance.id}">${message(code: 'default.button.show.label', default: 'Show')}</g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${scoreLevelInstanceTotal}" />
            </div>
        </div>
        </div>
    </body>
</html>
