<g:set var="entityName" value="${message(code: 'feedback.label', default: 'Feedback')}" />
<jq:jquery>
				var feedback = $( "#feedback" ),feedbackPeople = $( "#feedbackPeople" ),
				allFields = $( [] ).add(feedback).add(feedbackPeople),tips = $( ".validateTips" );
				function updateTips( t ) {
					tips.text( t ).addClass( "ui-state-highlight" );
					setTimeout(function() {
						tips.removeClass( "ui-state-highlight", 1500 );
					}, 500 );
				}
	
				function checkLength( o, n, min ) {
					if (o.val().length < min ) {
						o.addClass( "ui-state-error" );
						updateTips( n + "${message(code: 'default.js.null.message', default: 'cannot be null!')}" );
						return false;
					} else {
						return true;
					}
				}
		     	
				$( "#feedback-form" ).dialog({
					autoOpen: false,
					resizable: false,
					height: 400,
					width: 550,
					modal: true,
					buttons: {
						"${message(code: 'default.button.create.label', default: 'Create')}": function() {
							var bValid = true;
							var feedbackForm=$(this);
							allFields.removeClass( "ui-state-error" );		
							bValid = bValid && checkLength(feedback, "${message(code: 'personalPerformance.feedback.label', default: 'Feedback')}", 1);
							bValid = bValid && checkLength(feedbackPeople, "${message(code: 'personalPerformance.feedbackPeople.label', default: 'Feedback People')}", 1);	
							if ( bValid ) {
									$.getJSON("${createLink(controller:'superiorPersonPerformance', action: 'addFeedback')}", { feedback:feedback.val(),feedbackPeople:feedbackPeople.val(),id:$("#personalPerformanceId").val()},function(json){
									if(!jQuery.isEmptyObject(json)){
										$("#sFeedback").html(json.feedback);
										$("#sFeedbackPeople").html(json.feedbackPeople);
										feedbackForm.dialog( "close" ); 
										}
									});
							}
						},
						"${message(code: 'default.button.cancel.label', default: 'Cancel')}": function() {
							$(this).dialog( "close" );
						}
					},
					close: function() {
						allFields.val("").removeClass( "ui-state-error" );
					}
				});	
</jq:jquery>
<div id="feedback-form" title="<g:message code="default.create.label" args="[entityName]" />">
				<p class="validateTips">${message(code: 'default.form.tips.label', default: 'All form fields are required.')}</p>
				<form>
				<fieldset>
					<label for="feedback"><g:message code="personalPerformance.feedback.label" default="Feedback" /></label>
					<g:textArea name="feedback"  style="width: 400px; height: 100px;" class="text ui-widget-content ui-corner-all"/>
					<label for="feedbackPeople"><g:message code="personalPerformance.feedbackPeople.label" default="Feedback People" />&nbsp;&nbsp;&nbsp;</label>
					<g:textField name="feedbackPeople" maxlength="50" class="text ui-widget-content ui-corner-all"/>
				</fieldset>
				</form>
			</div>