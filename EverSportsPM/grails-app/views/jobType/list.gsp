
<%@ page import="com.jdonee.JobType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'jobType.label', default: 'JobType')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <jq:jquery>
        	$("#jobTypeList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
        </jq:jquery>
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
                        	<g:sortableColumn property="name" title="${message(code: 'jobType.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'jobType.dateCreated.label', default: 'Date Created')}" />
                            
                            <th class="sortable" style="font-size:10px;">${message(code: 'default.operater.label', default: 'Operater')}</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${jobTypeInstanceList}" status="i" var="jobTypeInstance">
                        <tr class="${(i % 2) == 0 ? 'clickableOdd' : 'clickableEven'}">
                        	<td>${fieldValue(bean: jobTypeInstance, field: "name")}</td>
                        
                            <td><g:formatDate date="${jobTypeInstance.dateCreated}" /></td>
                            
                            <td class="notClickable">
                                    <g:link action="show" id="${jobTypeInstance.id}">
                                        <img  src="${resource(dir:'images/skin',file:'database_go.png')}" alt="${message(code: 'default.button.show.label', default: 'Show')}" />
                                    </g:link>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${jobTypeInstanceTotal}" />
            </div>
        </div>
        </div>
    </body>
</html>
