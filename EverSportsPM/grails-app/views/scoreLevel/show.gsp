
<%@ page import="com.jdonee.ScoreLevel" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'scoreLevel.label', default: 'ScoreLevel')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    	<jq:jquery>
        	$("#scoreLevelList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
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
                            <td valign="top" class="name"><g:message code="scoreLevel.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: scoreLevelInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="scoreLevel.level.label" default="Level" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: scoreLevelInstance, field: "level")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="scoreLevel.minValue.label" default="Min Value" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: scoreLevelInstance, field: "minValue")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="scoreLevel.maxValue.label" default="Max Value" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: scoreLevelInstance, field: "maxValue")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="scoreLevel.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${scoreLevelInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="scoreLevel.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${scoreLevelInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${scoreLevelInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
            </div>
        </div>
    </body>
</html>
