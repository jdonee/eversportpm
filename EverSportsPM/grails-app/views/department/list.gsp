
<%@ page import="com.jdonee.Department" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'department.label', default: 'Department')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <filterpane:includes />
        <jq:jquery>
        	$("#departmentList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
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
        	<filterpane:filterPane class="query_dialog" style="width:600px;" domain="com.jdonee.Department" filterProperties="${['name', 'code', 'closed','dateCreated']}" 
        	filterPropertyValues="${['dateCreated':[years:2001..2050,precision:'day']]}" dialog="true" visible="n" showSortPanel="n" showTitle="n" fullAssociationPathFieldNames="false"/>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>                        
                            <th class="sortable" style="font-size:10px;"><g:message code="department.company.label" default="company" /></th>
                        
                            <g:sortableColumn property="name" title="${message(code: 'department.name.label', default: 'name')}" params="${filterParams}"/>
                        
                            <g:sortableColumn property="code" title="${message(code: 'department.code.label', default: 'code')}" params="${filterParams}"/>
                        
                            <g:sortableColumn property="closed" title="${message(code: 'department.closed.label', default: 'closed')}" params="${filterParams}"/>
                            
                            <g:sortableColumn property="dateCreated" title="${message(code: 'department.dateCreated.label', default: 'dateCreated')}" params="${filterParams}"/>                            
                            
                            <th class="sortable" style="font-size:10px;">${message(code: 'default.operater.label', default: 'Operater')}</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${departmentInstanceList}" status="i" var="departmentInstance">
                        <tr class="${(i % 2) == 0 ? 'clickableOdd' : 'clickableEven'}">
                        
                            <td>${fieldValue(bean: departmentInstance, field: "company")}</td>
                        
                            <td>${fieldValue(bean: departmentInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: departmentInstance, field: "code")}</td>                  
                        
                             <td><g:formatBoolean boolean="${departmentInstance.closed}"/></td>
                        
                            <td><g:formatDate date="${departmentInstance.dateCreated}"/></td>
                            
                        	 <td class="notClickable">
                                    <g:link action="show" id="${departmentInstance.id}">
                                        <img  src="${resource(dir:'images/skin',file:'database_go.png')}" alt="${message(code: 'default.button.show.label', default: 'Show')}" />
                                    </g:link>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${departmentCount == null ? departmentInstanceTotal: departmentCount}" params="${filterParams}"/>
                <filterpane:filterButton text="${message(code: 'default.filter.label', default: 'Filter')}" /> 
            </div>
        </div>
        </div>
    </body>
</html>
