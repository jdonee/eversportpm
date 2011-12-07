
<%@ page import="com.jdonee.PersonalPerformance" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personalPerformance.label', default: 'PersonalPerformance')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'personalPerformance.css')}" />
        <jq:jquery>
        	$("#myPersonPerformanceList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
        	// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
			$( "#dialog:ui-dialog" ).dialog( "destroy" );
		</jq:jquery>
    </head>
    <body>
    	<h3 class="ui-widget-header"><g:message code="default.show.label" args="[entityName]" /></h3>
        <div id="pageBody">
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="mypersonPerformance.list.label" default="My Assess And Summary"/></g:link></span>
        </div>
        <br/>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody style="width: 100%;">
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value"><g:hiddenField name="personalPerformanceId" value="${personalPerformanceInstance?.id}" />${fieldValue(bean: personalPerformanceInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.performance.label" default="Performance" /></td>
                            
                            <td valign="top" class="value"><g:link controller="performance" action="show" id="${personalPerformanceInstance?.performance?.id}">${personalPerformanceInstance?.performance?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.job.label" default="Job" /></td>
                            
                            <td valign="top" class="value"><g:link controller="job" action="show" id="${personalPerformanceInstance?.job?.id}">${personalPerformanceInstance?.job?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.peripheralPeople.label" default="Peripheral People" /></td>                            
                            <td valign="top" class="value">
                            <div id="peripheral-contain" class="ui-widget">
										<table id="peripheral" class="ui-widget ui-widget-content">
											<thead>
												<tr class="ui-widget-header ">
													<th><g:message code="job.company.label" default="Company" /></th>
													<th><g:message code="job.department.label" default="Department" /></th>
													<th><g:message code="job.user.label" default="User" /></th>
													<th>${message(code: 'job.name.label', default: 'Name')}</th>
													<th>${message(code: 'job.code.label', default: 'Code')}</th>										
												</tr>
											</thead>
											<tbody>
												<g:each in="${jobInstanceList}" var="jobInstance">
												<tr id="peripheral-${jobInstance.code}" class="repeat">
													<td>${jobInstance?.company?.name?.encodeAsHTML()}</td>
                        
						                            <td>${jobInstance?.department?.name?.encodeAsHTML()}</td>
						                        
						                            <td>${jobInstance?.user?.username?.encodeAsHTML()}</td>						                           
						                        
						                            <td>${jobInstance?.name?.encodeAsHTML()}</td>
						                        
						                            <td>${jobInstance?.code?.encodeAsHTML()}</td>											
												</tr>
												</g:each>
											</tbody>
										</table>
								</div>
							</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.status.label" default="Status" /></td>
                            
                            <td valign="top" class="value">${personalPerformanceInstance?.status?.label?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${personalPerformanceInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${personalPerformanceInstance?.lastUpdated}" /></td>
                            
                        </tr>
                        
                        <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="kpiRules"><g:message code="personalPerformance.kpiRules.label" default="Kpi Rules" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'kpiRules', 'errors')}"> 
								<div id="kpi-contain" class="ui-widget">
										<table id="kpi" class="ui-widget ui-widget-content">
											<thead>
												<tr class="ui-widget-header ">
													<th><g:message code="kpiRule.desiredItem.label" default="Desired Item" /></th>
													<th><g:message code="kpiRule.targetValue.label" default="Target Value" /></th>
													<th><g:message code="kpiRule.description.label" default="Description" /></th>
													<th><g:message code="kpiRule.weight.label" default="Weight" /></th>												
												</tr>
											</thead>
											<tbody>
												<g:each in="${personalPerformanceInstance?.kpiRules?}" var="k">
												<tr id="kpi-${k.id}" class="repeat">
													<td>${k.desiredItem?.encodeAsHTML()}</td>
													<td>${k.targetValue?.encodeAsHTML()}</td>
													<td>${k.description?.encodeAsHTML()}</td>
													<td>${k.weight?.encodeAsHTML()}</td>
												</tr>
												</g:each>
											</tbody>
										</table>
								</div>
                                </td>
                            </tr> 
                            
                        <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="jobRules"><g:message code="personalPerformance.jobRules.label" default="Job Rules" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'jobRules', 'errors')}">
                                <div id="job-contain" class="ui-widget">
										<table id="job" class="ui-widget ui-widget-content">
											<thead>
												<tr class="ui-widget-header ">
													<th><g:message code="jobRule.jobItem.label" default="Job Item" /></th>
													<th><g:message code="jobRule.personSummary.label" default="Person Summary" /></th>
													<th><g:message code="jobRule.customed.label" default="Customed" /></th>
													<th><g:message code="default.operater.label"  default="Operater"/></th>
												</tr>
											</thead>
											<tbody>
												<g:each in="${personalPerformanceInstance?.jobRules?}" var="j">
												<tr id="job-${j.id}" class="repeat">
													<td>${j.jobItem?.encodeAsHTML()}</td>													
													<td>${j.personSummary?.encodeAsHTML()}</td>
													<td><g:formatBoolean boolean="${j?.customed}" /></td>
													<td>
													<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[3]'">    
														<button class="update">${message(code: 'default.button.summary.label', default: 'Summary')}</button>
													</g:grep>
													&nbsp;
													</td>							
												</tr>
												</g:each>
											</tbody>
										</table>
								</div>
                                </td>
                            </tr> 
                        
                        <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="companyRules"><g:message code="personalPerformance.companyRules.label" default="Company Rules" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'companyRules', 'errors')}">
									<div id="company-contain" class="ui-widget">
										<table id="company" class="ui-widget ui-widget-content">
											<thead>
												<tr class="ui-widget-header ">
													<th><g:message code="companyRule.content.label" default="Content" /></th>
													<th><g:message code="companyRule.personSummary.label" default="Person Summary" /></th>
													<th><g:message code="companyRule.customed.label" default="Customed" /></th>
													<th><g:message code="default.operater.label"  default="Operater"/></th>
												</tr>
											</thead>
											<tbody>
												<g:each in="${personalPerformanceInstance?.companyRules?}" var="c">
												<tr id="company-${c.id}" class="repeat">
													<td>${c.content?.encodeAsHTML()}</td>
													<td>${c.personSummary?.encodeAsHTML()}</td>
													<td><g:formatBoolean boolean="${c?.customed}" /></td>
													<td>
													<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[3]'">
														<button class="update">${message(code: 'default.button.summary.label', default: 'Summary')}</button>
													</g:grep>
													&nbsp;</td>
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
            <g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[3456]'">
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${personalPerformanceInstance?.id}" />
                    	<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[3]'">    
                    	<span class="button"><g:actionSubmit class="check" action="personSummary" value="${message(code: 'default.button.personSummary.label', default: 'Person Summary')}"/></span>
                    	</g:grep>
                    	<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[4]'">    
                    	<span class="button"><g:actionSubmit class="uncheck" action="refreshPersonSummary" value="${message(code: 'default.button.refreshPersonSummary.label', default: 'Refresh Person Summary')}"/></span>
                    	</g:grep>
                    	<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[5]'">    
                    	<span class="button"><g:actionSubmit class="check" action="personAffirm" value="${message(code: 'default.button.personAffirm.label', default: 'Person Affirm')}"/></span>
                    	</g:grep>
                    	<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[6]'">    
                    	<span class="button"><g:actionSubmit class="uncheck" action="refreshPersonAffirm" value="${message(code: 'default.button.refreshPersonAffirm.label', default: 'Refresh Person Affirm')}"/></span>
                    	</g:grep>
                </g:form>
            </div>
            </g:grep>
               
        </div>
        </div>
        <div class="hiddenForms">
			<g:render template="createAndEditJobRule" />
			<g:render template="createAndEditCompanyRule" />		
			</div><!-- End demo -->   
    </body>
</html>
