
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
            <span class="menuButton"><g:link class="list" action="list"><g:message code="peripheralpersonPerformance.list.label" default="Peripheral Person Performance"/></g:link></span>
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
                            <td valign="top" class="name"><g:message code="personalPerformance.status.label" default="Status" /></td>
                            
                            <td valign="top" class="value">${personalPerformanceInstance?.status?.label?.encodeAsHTML()}</td>
                            
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
													<th><g:message code="jobRule.customed.label" default="Customed" /></th>													
													<th><g:message code="jobRuleScore.score.label" default="Score" /></th>
													<th><g:message code="jobRuleScore.used.label" default="Used" /></th> 
													<th><g:message code="default.operater.label"  default="Operater"/></th>
												</tr>
											</thead>
											<tbody>
												<g:each in="${personalPerformanceInstance?.jobRules?}" var="j">
												<tr id="job-${com.jdonee.JobRuleScore.findByJobRuleAndJob(j,currectJob).id}" class="repeat">
													<td>${j.jobItem?.encodeAsHTML()}</td>													
													<td>${j.personSummary?.encodeAsHTML()}</td>
													<td>${j.peripheralScore?.encodeAsHTML()}</td>
													<td><g:formatBoolean boolean="${j?.customed}" /></td>
													<td>${com.jdonee.JobRuleScore.findByJobRuleAndJob(j,currectJob).score?.encodeAsHTML()}</td>
													<td><g:formatBoolean boolean="${com.jdonee.JobRuleScore.findByJobRuleAndJob(j,currectJob).used}" /></td>													
													<td>
													<g:grep in="${personalPerformanceInstance?.status?.code?.encodeAsHTML()}" filter="~'[4]'">    
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
                    </tbody>
                </table>
            </div>
        </div>
        </div>
        <div class="hiddenForms">
			<g:render template="createAndEditJobRuleScore" />	
			</div><!-- End demo -->   
    </body>
</html>
