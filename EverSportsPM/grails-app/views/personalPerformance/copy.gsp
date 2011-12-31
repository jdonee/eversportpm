<%@ page import="com.jdonee.PersonalPerformance" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personalPerformance.label', default: 'PersonalPerformance')}" />
        <jqval:resources />
        <jqvalui:resources />
        <jqvalui:renderValidationScript for="com.jdonee.PersonalPerformance" not="performance,peripheralPeople,job,feedback,feedbackPeople,dateCreated,lastUpdated" form="personalPerformanceForm" errorClass="invalid" validClass="success" onsubmit="false"  renderErrorsOnTop="true" />
        <link rel="stylesheet" href="${resource(dir:'js/select-autocomplete',file:'autocomplete.css')}"/>
		<g:javascript src="select-autocomplete/jquery.autocomplete.js"/>
		<g:javascript src="select-autocomplete/jquery.select-autocomplete.js"/>
        <title><g:message code="default.copy.label" args="[entityName]" /></title>
    </head>
    <body>
        <h3 class="ui-widget-header"><g:message code="default.copy.label" args="[entityName]" /></h3>
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
            <g:form action="copyAndSave" name="personalPerformanceForm">                
			<jq:jquery>
			        $("#personalPerformanceList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
			        getPersonalPerformances($("select[id^='job']").val(),$("select[id^='performance']").val());
			        $('select.autocomplete').select_autocomplete({width:'300px'});
			    	$('select.autocomplete').show();
			    	$("select[id^='performance']").change(function() {
						getPersonalPerformances($("select[id^='job']").val(),$(this).val());
					});
					$("select[id^='job']").change(function() {
						getPersonalPerformances($(this).val(),$("select[id^='performance']").val());
					});
					function getPersonalPerformances(jobId,performanceId){
						$.getJSON("${createLink(controller:'personalPerformance',action:'getPersonalPerformances')}", 
						 			{jobId:jobId,performanceId:performanceId}, // 参数 
						 			function(data){
						 				$("#personalPerformanceId").empty();
										for(i=0;i < data.length ;i++){ 
											document.getElementById("personalPerformanceId").options.add(new Option(data[i][2].name+"("+data[i][1].name+")",data[i][0]));
										} 
									});
						}
			</jq:jquery>
<div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="performance"><g:message code="personalPerformance.performance.label" default="Performance" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'performance', 'errors')}">
                                    <g:select name="performance.id" from="${com.jdonee.Performance.findAllByClosed(Boolean.FALSE)}" optionKey="id" value="${personalPerformanceInstance?.performance?.id}"  />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="job"><g:message code="personalPerformance.job.label" default="Job" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'job', 'errors')}">
                                    <g:select name="job.id" class="autocomplete" from="${jobInstanceList}" optionKey="id" value="${personalPerformanceInstance?.job?.id}"  />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="personalPerformances"><g:message code="personalPerformance.personalPerformances.label" default="Personal Performances" /></label>
                                </td>
                                <td valign="top" class="value">
                                	<select id="personalPerformanceId" name="personalPerformanceId">
                                		 <option value=""><g:message code="default.select.option" default="--please select--"/></option>  
		                            </select>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
</div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" action="copyAndSave" value="${message(code: 'default.button.copy.label', default: 'Copy')}" /></span>
                </div>
            </g:form>
            </div>
        </div>
    </body>
</html>
