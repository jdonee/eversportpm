
<%@ page import="com.jdonee.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    	<jq:jquery>
        	$("#userList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
</jq:jquery>
    </head>
    <body>
        <h3 class="ui-widget-header"><g:message code="default.show.label" args="[entityName]" /></h3>
    	<div id="pageBody">
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <br/>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.username.label" default="Username" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "username")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.password.hash.label" default="Password[Hashcode]" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "password")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.employeeName.label" default="Employee Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "employeeName")}</td>
                            
                        </tr> 
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.enabled.label" default="Enabled"/></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.enabled}"/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.accountExpired.label" default="Account Expired" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${userInstance.accountExpired}"/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.accountLocked.label" default="Account Locked" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${userInstance.accountLocked}"/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.passwordExpired.label" default="Password Expired" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${userInstance.passwordExpired}"/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${userInstance?.dateCreated}"/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${userInstance?.lastUpdated}"/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.jobs.label" default="Jobs" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${userInstance.jobs}" var="j">
                                    <li><g:link controller="job" action="show" id="${j.id}">${j?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                        
                         <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.roles.label" default="Roles" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${userInstance.authorities}" var="r">
                                    <li><g:link controller="role" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${userInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: '你确定要删除?')}');" /></span>
                </g:form>
            </div>
            </div>
        </div>
    </body>
</html>
