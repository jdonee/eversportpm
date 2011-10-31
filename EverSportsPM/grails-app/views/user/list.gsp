
<%@ page import="com.jdonee.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <filterpane:includes />
        <jq:jquery>
        	$("#userList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
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
        	<filterpane:filterPane class="query_dialog" style="width:600px;" domain="com.jdonee.User" filterProperties="${['username', 'email', 'enabled','accountExpired','accountLocked','passwordExpired','dateCreated']}" 
        	filterPropertyValues="${['dateCreated':[years:2001..2050,precision:'day']]}" dialog="true" visible="n" showSortPanel="n" showTitle="n" fullAssociationPathFieldNames="false"/>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        	<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}" params="${filterParams}" />
                        
                            <g:sortableColumn property="firstName" title="${message(code: 'user.firstName.label', default: 'First Name')}"  params="${filterParams}"/>
                        
                            <g:sortableColumn property="lastName" title="${message(code: 'user.lastName.label', default: 'Last Name')}"  params="${filterParams}"/>
                        
                            <g:sortableColumn property="email" title="${message(code: 'user.email.label', default: 'Email')}"  params="${filterParams}"/>
                            
                            <g:sortableColumn property="enabled" title="${message(code: 'user.enabled.label', default: 'Enabled')}"  params="${filterParams}"/>
                            
                            <g:sortableColumn property="accountExpired" title="${message(code: 'user.accountExpired.label', default: 'Account Expired')}"  params="${filterParams}"/>
                            
                            <g:sortableColumn property="accountLocked" title="${message(code: 'user.accountLocked.label', default: 'Account Locked')}"  params="${filterParams}"/>
                            
                            <g:sortableColumn property="passwordExpired" title="${message(code: 'user.passwordExpired.label', default: 'Password Expired')}"  params="${filterParams}"/>
                            
                            <g:sortableColumn property="dateCreated" title="${message(code: 'user.dateCreated.label', default: 'Date Created')}"  params="${filterParams}"/>
                            
                            <th class="sortable" style="font-size:10px;">${message(code: 'default.operater.label', default: 'Operater')}</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${userInstanceList}" status="i" var="userInstance">
                        <tr class="${(i % 2) == 0 ? 'clickableOdd' : 'clickableEven'}">
                        	<td>${fieldValue(bean: userInstance, field: "username")}</td>
                        
                            <td>${fieldValue(bean: userInstance, field: "firstName")}</td>
                        
                            <td>${fieldValue(bean: userInstance, field: "lastName")}</td>
                        
                            <td>${fieldValue(bean: userInstance, field: "email")}</td>
                            
                            <td><g:formatBoolean boolean="${userInstance.enabled}"/></td>
                            
                            <td><g:formatBoolean boolean="${userInstance.accountExpired}"/></td>
                            
                            <td><g:formatBoolean boolean="${userInstance.accountLocked}"/></td>
                            
                            <td><g:formatBoolean boolean="${userInstance.passwordExpired}"/></td>
                            
                            <td><g:formatDate date="${userInstance.dateCreated}"/></td>
                        
                        	<td class="notClickable">
                                    <g:link action="show" id="${userInstance.id}">
                                        <img  src="${resource(dir:'images/skin',file:'database_go.png')}" alt="${message(code: 'default.button.show.label', default: 'Show')}" />
                                    </g:link>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${userCount == null ? userInstanceTotal: userCount}" params="${filterParams}"/>
                <filterpane:filterButton text="${message(code: 'default.filter.label', default: 'Filter')}" /> 
            </div>
        </div>
        </div>
    </body>
</html>
