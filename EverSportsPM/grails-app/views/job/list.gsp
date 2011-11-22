<%@ page import="com.jdonee.Job" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'job.label', default: 'Job')}" />
        <export:resource />
        <filterpane:includes />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <jq:jquery>
        	$("#jobList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
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
           <div id="options">
                <g:form method="post" action="setSearchParamsMax" style="height:40px;">
                    <g:hiddenField name="params" value="${filterParams}" />
                    <div class="dialog">
                        <table>
                            <tbody>
                                <tr class="prop">
                                    <td valign="top" class="name">
                                        <label for="max"><g:message code="default.perpage.label" default="Results per page" />:</label>
                                        <input type="text" maxlength="4" id="newMax" name="newMax" value="${params.max}"/>
                                    </td>
                                    <td valign="top" class="value">
                                        <span class="buttons">
                                            <g:actionSubmit action="setSearchParamsMax" class="go" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                        </span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </g:form>
                <div class="paginateButtons">
                <g:message code="default.results.label" default="Results" />: ${jobInstanceList.size()} / ${jobInstanceTotal}
                <span class="searchButtons">
                    <filterpane:filterButton text="${message(code: 'default.filter.label', default: 'Filter')}" /> 
                </span>
            </div>
            </div>
            <br/>
            <filterpane:filterPane action="list" class="query_dialog" style="width:600px;"  domain="com.jdonee.Job" filterProperties="${['name', 'code', 'closed','dateCreated','companyResponsible','parentCode']}" 
        	filterPropertyValues="${['dateCreated':[years:2001..2050,precision:'day']]}" dialog="true" visible="n" showSortPanel="n" showTitle="n" fullAssociationPathFieldNames="false"/>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <th class="sortable" style="font-size:10px;"><g:message code="job.company.label" default="Company" /></th>
                        
                            <th class="sortable" style="font-size:10px;"><g:message code="job.department.label" default="Department" /></th>
                        
                            <th class="sortable" style="font-size:10px;"><g:message code="job.user.label" default="User" /></th>
                            
                            <th class="sortable" style="font-size:10px;"><g:message code="job.jobType.label" default="Job Type" /></th>
                        
                            <g:sortableColumn property="name" title="${message(code: 'job.name.label', default: 'Name')}" params="${filterParams}"/>
                        
                            <g:sortableColumn property="code" title="${message(code: 'job.code.label', default: 'Code')}" params="${filterParams}"/>
                            
                            <g:sortableColumn property="companyResponsible" title="${message(code: 'job.companyResponsible.label', default: 'Company Responsible')}" params="${filterParams}"/>
                        
                            <g:sortableColumn property="parentCode" title="${message(code: 'job.parentCode.label', default: 'Parent Code')}" params="${filterParams}"/>                            
                        
                            <g:sortableColumn property="closed" title="${message(code: 'job.closed.label', default: 'Closed')}" params="${filterParams}"/>
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'job.dateCreated.label', default: 'Date Created')}" params="${filterParams}"/>                         
                        
                        	<th class="sortable" style="font-size:10px;">${message(code: 'default.operater.label', default: 'Operater')}</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${jobInstanceList}" status="i" var="jobInstance">
                        <tr class="${(i % 2) == 0 ? 'clickableOdd' : 'clickableEven'}">
                            <td>${fieldValue(bean: jobInstance, field: "company")}</td>
                        
                            <td>${fieldValue(bean: jobInstance, field: "department")}</td>
                        
                            <td>${fieldValue(bean: jobInstance, field: "user")}</td>
                            
                            <td>${fieldValue(bean: jobInstance, field: "jobType")}</td>
                        
                            <td>${fieldValue(bean: jobInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: jobInstance, field: "code")}</td>
                        
                        	<td><g:formatBoolean boolean="${jobInstance.companyResponsible}"/></td>
                        
                            <td>${fieldValue(bean: jobInstance, field: "parentCode")}</td>
                        
                            <td><g:formatBoolean boolean="${jobInstance.closed}"/></td>
                        
                            <td><g:formatDate date="${jobInstance.dateCreated}"/></td>                            
                            
                            <td class="notClickable">
                                    <g:link action="show" id="${jobInstance.id}">
                                        <img  src="${resource(dir:'images/skin',file:'database_go.png')}" alt="${message(code: 'default.button.show.label', default: 'Show')}" />
                                    </g:link>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${jobInstanceTotal}" params="${filterParams}" />
            </div>
            <export:formats  params="${filterParams}" formats="['csv', 'excel', 'rtf','pdf']"/>
        </div>
        </div>
    </body>
</html>
