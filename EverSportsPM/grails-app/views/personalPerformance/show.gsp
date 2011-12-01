
<%@ page import="com.jdonee.PersonalPerformance" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personalPerformance.label', default: 'PersonalPerformance')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'personalPerformance.css')}" />
        <jq:jquery>
        	$("#personalPerformanceList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
        	// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
			$( "#dialog:ui-dialog" ).dialog( "destroy" );
				$("#create-peripheralPeople" ).button().click(function() {
						$( "#peripheralPeople-form" ).dialog( "open" );
				});
				$("#create-CompanyRule" ).button().click(function() {
						$( "#company-form" ).dialog( "open" );
				});
				$("#create-jobRule" ).button().click(function() {
						$( "#job-form" ).dialog( "open" );
				});
				$( "#create-kpiRule" ).button().click(function() {
						$( "#kpi-form" ).dialog( "open" );
				});
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
                            <td valign="top" class="name"><g:message code="personalPerformance.companyRuleLevel.label" default="Company Rule Level" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personalPerformanceInstance, field: "companyRuleLevel")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.mainLevel.label" default="Main Level" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personalPerformanceInstance, field: "mainLevel")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.jobRuleScore.label" default="Job Rule Score" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personalPerformanceInstance, field: "jobRuleScore")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.kpiRuleScore.label" default="Kpi Rule Score" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personalPerformanceInstance, field: "kpiRuleScore")}</td>
                            
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
													<th><g:message code="default.operater.label"  default="Operater"/></th>												
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
													<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[01]'">    	
													<td><button class="del">${message(code: 'default.button.delete.label', default: 'Delete')}</button></td>
													</g:grep>												
												</tr>
												</g:each>
											</tbody>
										</table>
								</div>
								<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[01]'">
									<br/>    
									<button id="create-peripheralPeople">${message(code: 'default.add.label', args: [message(code: 'personalPerformance.peripheralPeople.label', default: 'Peripheral People')])}</button>
								</g:grep>
							</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.score.label" default="Score" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personalPerformanceInstance, field: "score")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.status.label" default="Status" /></td>
                            
                            <td valign="top" class="value">${personalPerformanceInstance?.status?.label?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.feedback.label" default="Feedback" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personalPerformanceInstance, field: "feedback")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.feedbackPeople.label" default="Feedback People" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personalPerformanceInstance, field: "feedbackPeople")}</td>
                            
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
													<th><g:message code="default.operater.label"  default="Operater"/></th>
													<%--<th><g:message code="kpiRule.actualValue.label" default="Actual Value" /></th>
													<th><g:message code="kpiRule.score.label" default="Score" /></th>--%>													
												</tr>
											</thead>
											<tbody>
												<g:each in="${personalPerformanceInstance?.kpiRules?}" var="k">
												<tr id="kpi-${k.id}" class="repeat">
													<td>${k.desiredItem?.encodeAsHTML()}</td>
													<td>${k.targetValue?.encodeAsHTML()}</td>
													<td>${k.description?.encodeAsHTML()}</td>
													<td>${k.weight?.encodeAsHTML()}</td>
													<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[0]'">    	
													<td><button class="update">${message(code: 'default.button.update.label', default: 'Update')}</button><button class="del">${message(code: 'default.button.delete.label', default: 'Delete')}</button></td>
													</g:grep>												
													<%--<td>${k.actualValue?.encodeAsHTML()}</td>
													<td>${k.score?.encodeAsHTML()}</td>--%>
												</tr>
												</g:each>
											</tbody>
										</table>
								</div>
								<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[0]'">
									<br/>    
									<button id="create-kpiRule">${message(code: 'default.add.label', args: [message(code: 'kpiRule.label', default: 'KpiRule')])}</button>
								</g:grep>
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
													<th><g:message code="jobRule.customed.label" default="Customed" /></th>
													<th><g:message code="default.operater.label"  default="Operater"/></th>
													<%--<th><g:message code="jobRule.personSummary.label" default="Person Summary" /></th>
													<th><g:message code="jobRule.peripheralScore.label" default="Peripheral Score" /></th>
													<th><g:message code="jobRule.score.label" default="Score" /></th>
													<th><g:message code="jobRule.expectation.label" default="Expectation" /></th> --%>
												</tr>
											</thead>
											<tbody>
												<g:each in="${personalPerformanceInstance?.jobRules?}" var="j">
												<tr id="job-${j.id}" class="repeat">
													<td>${j.jobItem?.encodeAsHTML()}</td>
													<td><g:formatBoolean boolean="${j?.customed}" /></td>
													<td>
													<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[0]'">    
													<g:if test="${j?.customed==true}">
														<button class="update">${message(code: 'default.button.update.label', default: 'Update')}</button><button class="del">${message(code: 'default.button.delete.label', default: 'Delete')}</button>
													</g:if>
													</g:grep>
													&nbsp;
													</td>
													<%--<td>${j.personSummary?.encodeAsHTML()}</td>
													<td>${j.peripheralScore?.encodeAsHTML()}</td>
													<td>${j.score?.encodeAsHTML()}</td>
													<td>${j.expectation?.encodeAsHTML()}</td>--%>								
												</tr>
												</g:each>
											</tbody>
										</table>
								</div>
								<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[0]'">    
								<br/>                                    
								<button id="create-jobRule">${message(code: 'default.add.label', args: [message(code: 'jobRule.label', default: 'JobRule')])}</button>
                                </g:grep>
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
													<th><g:message code="companyRule.customed.label" default="Customed" /></th>
													<th><g:message code="default.operater.label"  default="Operater"/></th>
												</tr>
											</thead>
											<tbody>
												<g:each in="${personalPerformanceInstance?.companyRules?}" var="c">
												<tr id="company-${c.id}" class="repeat">
													<td>${c.content?.encodeAsHTML()}</td>
													<td><g:formatBoolean boolean="${c?.customed}" /></td>
													<td>
													<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[0]'">    
													<g:if test="${c?.customed==true}">
														<button class="update">${message(code: 'default.button.update.label', default: 'Update')}</button><button class="del">${message(code: 'default.button.delete.label', default: 'Delete')}</button>
													</g:if>
													</g:grep>
													&nbsp;</td>
												</tr>
												</g:each>
											</tbody>
										</table>
									</div>
									<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[0]'">    
									<br/>
									<button id="create-CompanyRule">${message(code: 'default.add.label', args: [message(code: 'companyRule.label', default: 'CompanyRule')])}</button>
                                	</g:grep>
                                </td>
                            </tr>
                    </tbody>
                </table>
            </div>
            <g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[012]'"><%--只有在初始化和已完成指标状态下可以在此编辑和删除 --%>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${personalPerformanceInstance?.id}" />
                    	<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[01]'">                    
                    	<span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    	<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    	</g:grep>
                    	<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[0]'">    
                    	<span class="button"><g:actionSubmit class="check" action="inputFinish" value="${message(code: 'default.button.inputFinish.label', default: 'Finish')}"/></span>
                    	</g:grep>
                    	<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[1]'">    
                    	<span class="button"><g:actionSubmit class="uncheck" action="refresh" value="${message(code: 'default.button.refresh.label', default: 'Refresh')}"/></span>
                    	<g:if test="${checkPermission}">
                    	<span class="button"><g:actionSubmit class="check" action="audit" value="${message(code: 'default.button.audit.label', default: 'Audit')}"/></span>
                    	</g:if>
                    	</g:grep>
                    	<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[2]'">
                    	<g:if test="${checkPermission}">    
                    	<span class="button"><g:actionSubmit class="uncheck" action="abandon" value="${message(code: 'default.button.abandon.label', default: 'Abandon')}"/></span>
                    	<span class="button"><g:actionSubmit class="check" action="assess" value="${message(code: 'default.button.assess.label', default: 'Assess')}" onclick="return confirm('${message(code: 'personalPerformance.button.commit.confirm.message', default: 'The operater can\'t rollback,Are you sure?')}');"/></span>
                    	</g:if>
                    	</g:grep>
                </g:form>
            </div>
            </g:grep>
               
        </div>
        </div>
        <div class="hiddenForms">
        	<g:render template="createAndEditPeripheralPeople" />
        	<g:render template="createAndEditKpiRule" />
			<g:render template="createAndEditJobRule" />
			<g:render template="createAndEditCompanyRule" />		
			</div><!-- End demo -->   
    </body>
</html>
