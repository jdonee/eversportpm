<%@ page import="com.jdonee.PersonalPerformance" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personalPerformance.label', default: 'PersonalPerformance')}" />
        <jqval:resources />
        <jqvalui:resources />
        <jqvalui:renderValidationScript for="com.jdonee.PersonalPerformance" not="performance,job,feedback,feedbackPeople,dateCreated,lastUpdated" form="personalPerformanceForm" errorClass="invalid" validClass="success" onsubmit="false"  renderErrorsOnTop="true" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <jq:jquery>
        $("#personalPerformanceList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
        </jq:jquery>
    </head>
    <body>
        <h3 class="ui-widget-header"><g:message code="default.create.label" args="[entityName]" /></h3>
    	<div id="pageBody">
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <br/>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${personalPerformanceInstance}">
            <jqvalui:renderErrors style="margin-bottom:10px">
	                <g:renderErrors bean="${personalPerformanceInstance}" as="list" />
	            </jqvalui:renderErrors>
            </g:hasErrors>
            <g:form action="save" name="personalPerformanceForm">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="performance"><g:message code="personalPerformance.performance.label" default="Performance" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'performance', 'errors')}">
                                    <g:select name="performance.id" from="${com.jdonee.Performance.list()}" optionKey="id" value="${personalPerformanceInstance?.performance?.id}"  />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="job"><g:message code="personalPerformance.job.label" default="Job" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'job', 'errors')}">
                                    <g:select name="job.id" from="${com.jdonee.Job.list()}" optionKey="id" value="${personalPerformanceInstance?.job?.id}"  />
                                </td>
                                <td>&nbsp;</td>
                            </tr>                                              
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="peripheralPeople"><g:message code="personalPerformance.peripheralPeople.label" default="Peripheral People" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'peripheralPeople', 'errors')}">
                                    <g:textArea name="peripheralPeople" value="${personalPerformanceInstance?.peripheralPeople}" style="width: 500px; height: 150px;"/>
                                </td>
                               <jq:jquery>
						        function split( val ) {
									return val.split( /,\s*/ );
								}
								function extractLast( term ) {
									return split( term ).pop();
								}
								$( "#peripheralPeople" )
									// don't navigate away from the field on tab when selecting an item
									.bind( "keydown", function( event ) {
										if ( event.keyCode === $.ui.keyCode.TAB &&
												$( this ).data( "autocomplete" ).menu.active ) {
											event.preventDefault();
										}
									})
									.autocomplete({
										source: function( request, response ) {
											$.getJSON( "${createLink(controller: 'personalPerformance', action: 'searchJobByCodeJSON')}", {
												term: extractLast( request.term )
											}, response );
										},
										search: function() {
											// custom minLength
											var term = extractLast( this.value );
											if ( term.length < 2 ) {
												return false;
											}
										},
										focus: function() {
											// prevent value inserted on focus
											return false;
										},
										select: function( event, ui ) {
											var terms = split( this.value );
											// remove the current input
											terms.pop();
											// add the selected item
											terms.push( ui.item.value );
											// add placeholder to get the comma-and-space at the end
											terms.push( "" );
											this.value = terms.join( ", " );
											return false;
										}
									});
									</jq:jquery>
                                <td>&nbsp;
								<g:if test="${hasErrors(bean: personalPerformanceInstance, field: 'peripheralPeople', 'errors')}">
									<jqvalui:renderError for="peripheralPeople" style="margin-top: -5px">
										<g:eachError bean="${personalPerformanceInstance}" field="peripheralPeople">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>                                                                                                 
                        	<tr><td colspan="3">&nbsp;</td></tr>
                            <tr><td colspan="3">&nbsp;</td></tr>
                            <tr><td colspan="3">&nbsp;</td></tr>
                            <tr><td colspan="3">&nbsp;</td></tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
            </div>
        </div>
    </body>
</html>
