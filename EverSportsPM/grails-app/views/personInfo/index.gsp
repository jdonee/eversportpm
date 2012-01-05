
<%@ page import="com.jdonee.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="personInfo.label" default="Person Info" /></title>
    	<jq:jquery>
        	$("#personInfoList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
        	$( "#dialog:ui-dialog" ).dialog( "destroy" );
			$( "#changePwd" ).button().click(function() {
						$( "#pwd-form" ).dialog( "open" );
			});
</jq:jquery>
    </head>
    <body>
        <h3 class="ui-widget-header"><g:message code="personInfo.label" default="Person Info" /></h3>
    	<div id="pageBody">
        <div class="nav">
     	&nbsp;
        </div>
        <br/>
        <div class="body">
            <div class="dialog">
                <table width="100%">
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.username.label" default="Username" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "username")}&nbsp;<button id="changePwd">${message(code: 'personInfo.changePwd.label', default: 'Change PWD')}</button></td>
                            
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
                            <td valign="top" class="name"><g:message code="user.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${userInstance?.dateCreated}"/></td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.roles.label" default="Roles" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${userInstance.authorities}" var="r">
                                    <li>${r?.encodeAsHTML()}</li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personInfo.details.label" default="Details" /></td>
                            <td valign="top" style="text-align: left;" class="value">
                            <div class="ui-widget">
								<table class="ui-widget ui-widget-content">
											<thead>
												<tr class="ui-widget-header ">
													<th><g:message code="job.company.label" default="Company" /></th>
													<th><g:message code="job.department.label" default="Department" /></th>
													<th><g:message code="user.employeeName.label" default="Employee Name" /></th>
													<th><g:message code="job.user.label" default="User" /></th>
													<th>${message(code: 'job.name.label', default: 'Name')}</th>
													<th>${message(code: 'job.jobType.label', default: 'Job Type')}</th>
													<th>${message(code: 'job.code.label', default: 'Code')}</th>
													<th>${message(code: 'job.personalPerformances.label', default: 'Personal Performances')}</th>											
												</tr>
											</thead>
											<tbody>
												<g:each in="${userInstance.jobs}" var="jobInstance">
												<tr>
													<td>${jobInstance?.company?.name?.encodeAsHTML()}</td>                        
						                            <td>${jobInstance?.department?.name?.encodeAsHTML()}</td>
						                            <td>${jobInstance?.user?.employeeName?.encodeAsHTML()}</td>							                        
						                            <td>${jobInstance?.user?.username?.encodeAsHTML()}</td>
						                            <td>${jobInstance?.name?.encodeAsHTML()}</td>							                           						                        
						                            <td>${jobInstance?.jobType?.encodeAsHTML()}</td>
						                            <td>${jobInstance?.code?.encodeAsHTML()}</td>						                        
						                            <td>
						                            <ul>
					                                <g:each in="${jobInstance?.personalPerformances}" var="p">
					                                    <li><g:link controller="personalPerformance" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					                                </g:each>
                                					</ul>
						                            </td>												
												</tr>
												</g:each>
											</tbody>
										</table>
								</div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </div>
        </div>
        <div class="hiddenForms">
			<g:render template="changePwd" />		
			</div>
    </body>
</html>
