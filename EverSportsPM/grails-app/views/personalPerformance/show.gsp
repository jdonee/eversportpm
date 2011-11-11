
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
		
			var name = $( "#name" ),
				email = $( "#email" ),
				password = $( "#password" ),
				allFields = $( [] ).add( name ).add( email ).add( password ),
				tips = $( ".validateTips" );

			function updateTips( t ) {
				tips
					.text( t )
					.addClass( "ui-state-highlight" );
				setTimeout(function() {
					tips.removeClass( "ui-state-highlight", 1500 );
				}, 500 );
			}

			function checkLength( o, n, min, max ) {
				if ( o.val().length > max || o.val().length < min ) {
					o.addClass( "ui-state-error" );
					updateTips( "Length of " + n + " must be between " +
						min + " and " + max + "." );
					return false;
				} else {
					return true;
				}
			}

			function checkRegexp( o, regexp, n ) {
				if ( !( regexp.test( o.val() ) ) ) {
					o.addClass( "ui-state-error" );
					updateTips( n );
					return false;
				} else {
					return true;
				}
			}
		
				$( "#dialog-form" ).dialog({
					autoOpen: false,
					height: 300,
					width: 350,
					modal: true,
					buttons: {
						"Create an account": function() {
							var bValid = true;
							allFields.removeClass( "ui-state-error" );
		
							bValid = bValid && checkLength( name, "username", 3, 16 );
							bValid = bValid && checkLength( email, "email", 6, 80 );
							bValid = bValid && checkLength( password, "password", 5, 16 );
		
							bValid = bValid && checkRegexp( name, /^[a-z]([0-9a-z_])+$/i, "Username may consist of a-z, 0-9, underscores, begin with a letter." );
							// From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
							bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com" );
							bValid = bValid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );
		
							if ( bValid ) {
								$( "#users tbody" ).append( "<tr>" +
									"<td>" + name.val() + "</td>" + 
									"<td>" + email.val() + "</td>" + 
									"<td>" + password.val() + "</td>" +
								"</tr>" ); 
								$( this ).dialog( "close" );
							}
						},
						Cancel: function() {
							$( this ).dialog( "close" );
						}
					},
					close: function() {
						allFields.val( "" ).removeClass( "ui-state-error" );
					}
				});
		
				$( "#create-CompanyRule" )
					.button()
					.click(function() {
						$( "#dialog-form" ).dialog( "open" );
					});
				$( "#create-jobRule" )
					.button()
					.click(function() {
						$( "#dialog-form" ).dialog( "open" );
					});
				$( "#create-kpiRule" )
					.button()
					.click(function() {
						$( "#dialog-form" ).dialog( "open" );
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
            <div class="dialog" style="width: 100%;">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personalPerformance.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personalPerformanceInstance, field: "id")}</td>
                            
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
                            
                            <td valign="top" class="value">${fieldValue(bean: personalPerformanceInstance, field: "peripheralPeople")}</td>
                            
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
										<table id="kpis" class="ui-widget ui-widget-content">
											<thead>
												<tr class="ui-widget-header ">
													<th>Name</th>
													<th>Email</th>
													<th>Password</th>
												</tr>
											</thead>
											<tbody>
												<g:each in="${personalPerformanceInstance?.kpiRules?}" var="k">
												<tr>
													<td>${k?.encodeAsHTML()}</td>
													<td>${k?.encodeAsHTML()}</td>
													<td>${k?.encodeAsHTML()}</td>
												</tr>
												</g:each>
											</tbody>
										</table>
								</div>
								<br/>    
								<button id="create-kpiRule">${message(code: 'default.add.label', args: [message(code: 'kpiRule.label', default: 'KpiRule')])}</button>
                                </td>
                            </tr> 
                            
                        <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="jobRules"><g:message code="personalPerformance.jobRules.label" default="Job Rules" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'jobRules', 'errors')}">
                                <div id="job-contain" class="ui-widget">
										<table id="jobs" class="ui-widget ui-widget-content">
											<thead>
												<tr class="ui-widget-header ">
													<th>Name</th>
													<th>Email</th>
													<th>Password</th>
												</tr>
											</thead>
											<tbody>
												<g:each in="${personalPerformanceInstance?.jobRules?}" var="j">
												<tr>
													<td>${j?.encodeAsHTML()}</td>
													<td>${j?.encodeAsHTML()}</td>
													<td>${j?.encodeAsHTML()}</td>
												</tr>
												</g:each>
											</tbody>
										</table>
								</div>
								<br/>                                    
								<button id="create-jobRule">${message(code: 'default.add.label', args: [message(code: 'jobRule.label', default: 'JobRule')])}</button>
                                </td>
                            </tr> 
                        
                        <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="companyRules"><g:message code="personalPerformance.companyRules.label" default="Company Rules" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'companyRules', 'errors')}">
									<div id="company-contain" class="ui-widget">
										<table id="companys" class="ui-widget ui-widget-content">
											<thead>
												<tr class="ui-widget-header ">
													<th>Name</th>
													<th>Email</th>
													<th>Password</th>
												</tr>
											</thead>
											<tbody>
												<g:each in="${personalPerformanceInstance?.companyRules?}" var="c">
												<tr>
													<td>${c?.encodeAsHTML()}</td>
													<td>${c?.encodeAsHTML()}</td>
													<td>${c?.encodeAsHTML()}</td>
												</tr>
												</g:each>
											</tbody>
										</table>
									</div>
									<br/>
									<button id="create-CompanyRule">${message(code: 'default.add.label', args: [message(code: 'companyRule.label', default: 'CompanyRule')])}</button>
                                </td>
                            </tr>
               
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${personalPerformanceInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
            <div class="demo">
            <div id="dialog-form" title="Create new user">
				<p class="validateTips">All form fields are required.</p>
			
				<form>
				<fieldset>
					<label for="name">Name</label>
					<input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all" />
					<label for="email">Email</label>
					<input type="text" name="email" id="email" value="" class="text ui-widget-content ui-corner-all" />
					<label for="password">Password</label>
					<input type="password" name="password" id="password" value="" class="text ui-widget-content ui-corner-all" />
				</fieldset>
				</form>
			</div>
			</div><!-- End demo -->      
        </div>
        </div>
    </body>
</html>
