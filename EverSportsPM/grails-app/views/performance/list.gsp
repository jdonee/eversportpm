
<%@ page import="com.jdonee.Performance" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'performance.label', default: 'Performance')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <filterpane:includes />
    </head>
    <body>
       <h3 class="ui-widget-header"><g:message code="default.list.label" args="[entityName]" /></h3>
    	<div id="pageBody">
        <div class="nav">
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <br/>
        <div class="body">
        	<filterpane:filterPane class="query_dialog" style="width:600px;" domain="com.jdonee.Performance" filterProperties="${['name', 'startDate', 'endDate','dateCreated']}" 
        	filterPropertyValues="${['startDate':[years:2001..2050,precision:'day'],'endDate':[years:2001..2050,precision:'day'],'dateCreated':[years:2001..2050,precision:'day']]}" dialog="true" visible="n" showSortPanel="n" showTitle="n" fullAssociationPathFieldNames="false"/>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        	<th class="sortable" style="font-size:10px;">${message(code: 'performance.id.label', default: 'Id')}</th>
                        
                            <g:sortableColumn property="name" title="${message(code: 'performance.name.label', default: 'Name')}" params="${filterParams}" />
                        
                            <g:sortableColumn property="startDate" title="${message(code: 'performance.startDate.label', default: 'Start Date')}" params="${filterParams}" />
                        
                            <g:sortableColumn property="endDate" title="${message(code: 'performance.endDate.label', default: 'End Date')}" params="${filterParams}" />
                        	
                        	<th class="sortable" style="font-size:10px;">${message(code: 'performance.mainWeight.label', default: 'Main Weight')}</th>
                        	
                            <th class="sortable" style="font-size:10px;">${message(code: 'performance.auxiliaryWeight.label', default: 'Auxiliary Weight')}</th>

                            <th class="sortable" style="font-size:10px;">${message(code: 'performance.peripheralWeight.label', default: 'Peripheral Weight')}</th>
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'performance.dateCreated.label', default: 'Date Created')}" params="${filterParams}" />

                            <th class="sortable" style="font-size:10px;">${message(code: 'default.operater.label', default: 'Operater')}</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${performanceInstanceList}" status="i" var="performanceInstance">
                        <tr class="${(i % 2) == 0 ? 'clickableOdd' : 'clickableEven'}">
                        
                            <td>${fieldValue(bean: performanceInstance, field: "id")}</td>
                        
                            <td>${fieldValue(bean: performanceInstance, field: "name")}</td>
                        
                            <td><g:formatDate date="${performanceInstance.startDate}" format="yyyy-MM-dd"/></td>
                        
                            <td><g:formatDate date="${performanceInstance.endDate}" format="yyyy-MM-dd"/></td>
                        
                            <td>${fieldValue(bean: performanceInstance, field: "mainWeight")}</td>
                        
                            <td>${fieldValue(bean: performanceInstance, field: "auxiliaryWeight")}</td> 
                            
                            <td>${fieldValue(bean: performanceInstance, field: "peripheralWeight")}</td>              
                                                                 
                            <td><g:formatDate date="${performanceInstance.dateCreated}"/></td>
                            
                            <td class="notClickable">
                                    <g:link action="show" id="${performanceInstance.id}">
                                        <img  src="${resource(dir:'images/skin',file:'database_go.png')}" alt="${message(code: 'default.button.show.label', default: 'Show')}" />
                                    </g:link>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${performanceCount == null ? performanceInstanceTotal: performanceCount}" params="${filterParams}"/>
                <filterpane:filterButton text="${message(code: 'default.filter.label', default: 'Filter')}" />
            </div>
        </div>
        </div>
    </body>
</html>
