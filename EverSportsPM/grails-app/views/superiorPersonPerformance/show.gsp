<%@ page import="com.jdonee.PersonalPerformance" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personalPerformance.label', default: 'PersonalPerformance')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'personalPerformance.css')}" />
        <jq:jquery>
        	$("#superiorPersonPerformanceList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
        	// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
			$( "#dialog:ui-dialog" ).dialog( "destroy" );
			$( "#create-Feedback" ).button().click(function() {
						$( "#feedback-form" ).dialog( "open" );
			});
		</jq:jquery>
    </head>
    <body>
    	<h3 class="ui-widget-header"><g:message code="default.show.label" args="[entityName]" /></h3>
        <div id="pageBody">
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="superiorPersonPerformance.list.label" default="Superior Assess And Summary"/></g:link></span>
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
                            <td valign="top" class="value">
                            ${fieldValue(bean: personalPerformanceInstance, field: "companyRuleLevel")}
                            </td>                            
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
                            <td valign="top" class="name"><g:message code="personalPerformance.score.label" default="Score" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personalPerformanceInstance, field: "score")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.status.label" default="Status" /></td>
                            
                            <td valign="top" class="value">${personalPerformanceInstance?.status?.label?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.feedback.label" default="Feedback" /></td>
                            
                            <td valign="top" class="value"><span id="sFeedback">${fieldValue(bean: personalPerformanceInstance, field: "feedback")}</span></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.feedbackPeople.label" default="Feedback People" /></td>
                            
                            <td valign="top" class="value"><span id="sFeedbackPeople">${fieldValue(bean: personalPerformanceInstance, field: "feedbackPeople")}</span></td>
                            
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
													<th><g:message code="kpiRule.actualValue.label" default="Actual Value" /></th>
													<th><g:message code="kpiRule.score.label" default="Score" /></th>
													<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[4]'">													
													<th><g:message code="default.operater.label"  default="Operater"/></th>
													</g:grep>																									
												</tr>
											</thead>
											<tbody>
												<g:each in="${personalPerformanceInstance?.kpiRules?}" var="k">
												<tr id="kpi-${k.id}" class="repeat">
													<td>${k.desiredItem?.encodeAsHTML()}</td>
													<td>${k.targetValue?.encodeAsHTML()}</td>
													<td>${k.description?.encodeAsHTML()}</td>
													<td>${k.weight?.encodeAsHTML()}</td>
													<td>${k.actualValue?.encodeAsHTML()}</td>
													<td>${k.score?.encodeAsHTML()}</td>
													<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[4]'">    	
													<td><button class="update">${message(code: 'default.button.summary.label', default: 'Summary')}</button>
													</g:grep>													
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
													<th><g:message code="jobRule.peripheralScore.label" default="Peripheral Score" /></th>
													<th><g:message code="jobRule.score.label" default="Score" /></th>
													<th><g:message code="jobRule.expectation.label" default="Expectation" /></th>
													<th><g:message code="jobRule.customed.label" default="Customed" /></th>
													<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[4]'">  
													<th><g:message code="default.operater.label"  default="Operater"/></th>
													</g:grep>
												</tr>
											</thead>
											<tbody>
												<g:each in="${personalPerformanceInstance?.jobRules?}" var="j">
												<tr id="job-${j.id}" class="repeat">
													<td>${j.jobItem?.encodeAsHTML()}</td>
													<td>${j.personSummary?.encodeAsHTML()}</td>
													<td>${j.peripheralScore?.encodeAsHTML()}</td>
													<td>${j.score?.encodeAsHTML()}</td>
													<td>${j.expectation?.encodeAsHTML()}</td>	
													<td><g:formatBoolean boolean="${j?.customed}" /></td>
													<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[4]'"> 
													<td><button class="update">${message(code: 'default.button.summary.label', default: 'Summary')}</button></td>
													</g:grep>																				
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
													<th><g:message code="companyRule.appraise.label" default="Appraise" /></th>
													<th><g:message code="companyRule.expectation.label" default="Expectation" /></th>
													<th><g:message code="companyRule.customed.label" default="Customed" /></th>
													<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[4]'"> 
													<th><g:message code="default.operater.label"  default="Operater"/></th>
													</g:grep>
												</tr>
											</thead>
											<tbody>
												<g:each in="${personalPerformanceInstance?.companyRules?}" var="c">
												<tr id="company-${c.id}" class="repeat">
													<td>${c.content?.encodeAsHTML()}</td>
													<td>${c.personSummary?.encodeAsHTML()}</td>
													<td>${c.appraise?.encodeAsHTML()}</td>
													<td>${c.expectation?.encodeAsHTML()}</td>
													<td><g:formatBoolean boolean="${c?.customed}" /></td>
													<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[4]'"> 
													<td><button class="update">${message(code: 'default.button.summary.label', default: 'Summary')}</button></td>
													</g:grep>
												</tr>
												</g:each>
											</tbody>
										</table>
									</div>
									<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[4]'">
									<div>					
										<jq:jquery>
														var value = $("input[name=companyRuleLevels]:checked").val();
														$("#companyRuleLevel").val(value);
														$("input[name=companyRuleLevels]").live('change',function(event) { 
        													$("#companyRuleLevel").val($(this).val());
        												});
										</jq:jquery>
										<span>${message(code: 'companyRule.scoreLevel.level.message', default: 'Company Rule Level:')}</span>                    	
                    					<span><g:radio name="companyRuleLevels" value="A" checked="checked"/>${message(code: 'companyRule.scoreLevel.level.a', default: 'Excellent')}</span>&nbsp;&nbsp;
                            			<span><g:radio name="companyRuleLevels" value="B" />${message(code: 'companyRule.scoreLevel.level.b', default: 'Better')}</span>&nbsp;&nbsp;
                            			<span><g:radio name="companyRuleLevels" value="C" />${message(code: 'companyRule.scoreLevel.level.c', default: 'Common')}</span>&nbsp;&nbsp;
                            			<span><g:radio name="companyRuleLevels" value="D" />${message(code: 'companyRule.scoreLevel.level.d', default: 'Pass')}</span>&nbsp;&nbsp;
                            			<span><g:radio name="companyRuleLevels" value="E" />${message(code: 'companyRule.scoreLevel.level.e', default: 'Fail')}</span>&nbsp;&nbsp;                
                    				</div>
                    				</g:grep>
                                </td>
                            </tr>
                            <g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[6]'">
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>&nbsp;</label>
                                </td>       
                            	<td valign="top" class="value"> 
									<br/>
									<button id="create-Feedback">${message(code: 'default.add.label', args: [message(code: 'feedback.label', default: 'Feedback')])}</button>
                            	</td>
                            </tr>
                            </g:grep>
                    </tbody>
                </table>
            </div>
            <g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[4567]'">
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${personalPerformanceInstance?.id}" />
                    	<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[4]'">
                    	<g:hiddenField name="companyRuleLevel" value="${personalPerformanceInstance?.companyRuleLevel}" />
                    	<span class="button"><g:actionSubmit class="check" action="superiorSummary" value="${message(code: 'default.button.superiorSummary.label', default: 'Superior Summary')}"/></span>
                    	</g:grep>
                    	<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[5]'">    
                    	<span class="button"><g:actionSubmit class="uncheck" action="refreshSuperiorSummary" value="${message(code: 'default.button.refreshSuperiorSummary.label', default: 'Refresh Summary')}"/></span>
                    	</g:grep>
                    	<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[6]'">    
                    	<span class="button"><g:actionSubmit class="check" action="superiorAffirm" value="${message(code: 'default.button.superiorAffirm.label', default: 'Superior Affirm')}"/></span>
                    	</g:grep>
                    	<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[7]'">  
                    	<span class="button"><g:actionSubmit class="uncheck" action="refreshSuperiorAffirm" value="${message(code: 'default.button.refreshSuperiorAffirm.label', default: 'Refresh Affirm')}"/></span>
                    	<span class="button"><g:actionSubmit class="check" action="closeAssess" value="${message(code: 'default.button.closeAssess.label', default: 'Close Assess')}" onclick="return confirm('${message(code: 'personalPerformance.button.commit.confirm.message', default: 'The operater can\'t rollback,Are you sure?')}');"/></span>
                    	</g:grep>
                </g:form>
            </div>
            </g:grep> 
        </div>
        </div>
        <div class="hiddenForms">
        	<g:render template="createAndEditKpiRule" />
			<g:render template="createAndEditJobRule" />
			<g:render template="createAndEditCompanyRule" />
			<g:render template="createFeedback" />		
			</div><!-- End demo -->   
    </body>
</html>
