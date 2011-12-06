
<%@ page import="com.jdonee.PersonalPerformance" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personalPerformance.label', default: 'PersonalPerformance')}" />
        <title><g:message code="peripheralpersonPerformance.list.label" default="Peripheral Person Performance"/></title>
        <jq:jquery>
        	$("#peripheralPersonPerformanceList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"}); 
		</jq:jquery>
    </head>
    <h3 class="ui-widget-header"><g:message code="peripheralpersonPerformance.list.label" default="Peripheral Person Performance"/></h3>
    	<div id="pageBody">
        <div class="nav">
        &nbsp;
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
                            <th><g:message code="personalPerformance.performance.label" default="Performance" /></th>
                        
                            <th><g:message code="personalPerformance.job.label" default="Job" /></th>                            
                            
                            <g:sortableColumn property="status" title="${message(code: 'personalPerformance.status.label', default: 'Status')}" />
                            
                            <g:sortableColumn property="dateCreated" title="${message(code: 'personalPerformance.dateCreated.label', default: 'Date Created')}" />
                            
                            <th class="sortable" style="font-size:10px;">${message(code: 'default.operater.label', default: 'Operater')}</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${personalPerformanceInstanceList}" status="i" var="personalPerformanceInstance">
                        <tr class="${(i % 2) == 0 ? 'clickableOdd' : 'clickableEven'}">                      
                            <td>${fieldValue(bean: personalPerformanceInstance, field: "performance")}</td>
                        
                            <td>${fieldValue(bean: personalPerformanceInstance, field: "job")}</td>
                        
                            <td>${personalPerformanceInstance?.status?.label?.encodeAsHTML()}</td>
                            
                            <td><g:formatDate date="${personalPerformanceInstance.dateCreated}"/></td>
                            
                            <td class="notClickable">
                                    <g:link action="show" id="${personalPerformanceInstance.id}">
                                        <img  src="${resource(dir:'images/skin',file:'database_go.png')}" alt="${message(code: 'default.button.show.label', default: 'Show')}" />
                                    </g:link>
                            </td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${personalPerformanceInstanceTotal}" />
            </div>
        </div>
        </div>
    </body>
</html>
