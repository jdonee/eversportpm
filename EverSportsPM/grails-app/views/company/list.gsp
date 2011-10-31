<%@ page import="com.jdonee.Company" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <filterpane:includes />
        <jq:jquery>
        	$("#companyList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
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
        	<filterpane:filterPane class="query_dialog" style="width:600px;" domain="com.jdonee.Company" filterProperties="${['name', 'code', 'closed','dateCreated']}" 
        	filterPropertyValues="${['dateCreated':[years:2001..2050,precision:'day']]}" dialog="true" visible="n" showSortPanel="n" showTitle="n" fullAssociationPathFieldNames="false"/>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="name" title="${message(code: 'company.name.label', default: 'Name')}" params="${filterParams}"/>
                        
                            <g:sortableColumn property="code" title="${message(code: 'company.code.label', default: 'Code')}" params="${filterParams}"/>       
                        
                            <g:sortableColumn property="closed" title="${message(code: 'company.closed.label', default: 'Closed')}" params="${filterParams}"/>
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'company.dateCreated.label', default: 'Date Created')}" params="${filterParams}"/>                          
                            
                            <th class="sortable" style="font-size:10px;">${message(code: 'default.operater.label', default: 'Operater')}</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${companyInstanceList}" status="i" var="companyInstance">
                        <tr class="${(i % 2) == 0 ? 'clickableOdd' : 'clickableEven'}">
                        
                            <td>${fieldValue(bean: companyInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: companyInstance, field: "code")}</td>                      
                        
                            <td><g:formatBoolean boolean="${companyInstance.closed}"/></td>
                        
                            <td><g:formatDate date="${companyInstance.dateCreated}"/></td>                            

                        	<td class="notClickable">
                                    <g:link action="show" id="${companyInstance.id}">
                                        <img  src="${resource(dir:'images/skin',file:'database_go.png')}" alt="${message(code: 'default.button.show.label', default: 'Show')}" />
                                    </g:link>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${companyCount == null ? companyInstanceTotal: companyCount}" params="${filterParams}"/>
                <filterpane:filterButton text="${message(code: 'default.filter.label', default: 'Filter')}" />                
            </div>
        </div>
        </div>
    </body>
</html>
