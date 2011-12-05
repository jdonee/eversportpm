<g:set var="entityName" value="${message(code: 'jobRule.label', default: 'JobRule')}" />
<jq:jquery>
			var jobItem = $( "#jobItem" ),jobRuleId=$("#jobRuleId"),personSummary=$("#personSummary"),allFields = $( [] ).add( jobItem ).add(jobRuleId).add(personSummary),tips = $( ".validateTips" );
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
			
			$("#job .update").live('click',function() {
					var updateItem=$(this);
					var id=updateItem.parent().parent().attr("id").replace("job-","");
					$.getJSON("${createLink(controller:'jobRule', action: 'getJobRuleById')}", { id: id }, 
						function(json){
						if(!jQuery.isEmptyObject(json)){
							jobRuleId.val(json.id);
							jobItem.html(json.jobItem);
							personSummary.val(json.personSummary);
							$( "#job-form" ).dialog( "open" );
						}
					});
		     	});	
			
			$( "#job-form" ).dialog({
					autoOpen: false,
					resizable: false,
					height: 400,
					width: 550,
					modal: true,
					buttons: {
						"${message(code: 'default.button.create.label', default: 'Create')}": function() {
							var bValid = true;
							var jobForm=$(this);
							allFields.removeClass( "ui-state-error" );		
							bValid = bValid && checkLength(personSummary, "${message(code: 'jobRule.personSummary.label', default: 'Person Summary')}", 1);		
							if ( bValid ) {
									$.getJSON("${createLink(controller:'jobRule', action: 'updateJobRule')}", { personSummary:personSummary.val(),jobRuleId:jobRuleId.val() },function(json){
									if(!jQuery.isEmptyObject(json)){
										$("#job-"+json.id).empty().append("<td>" + json.jobItem + "</td><td>" + json.personSummary + "</td><td>"+json.customed+"</td><td><button class='update'>${message(code: 'default.button.summary.label', default: 'Summary')}</button></td>");
										jobForm.dialog( "close" ); 
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
		<div id="job-form" title="<g:message code="default.create.label" args="[entityName]" />">
				<p class="validateTips">${message(code: 'default.form.tips.label', default: 'All form fields are required.')}</p>
				<form>
				<g:hiddenField name="jobRuleId"/>
				<fieldset>
					<label for="jobItem"><g:message code="jobRule.jobItem.label" default="Job Item" /></label>
					<p id="jobItem" class="text ui-widget-content ui-corner-all"></p>
					<label for="personSummary"><g:message code="jobRule.personSummary.label" default="Person Summary" /></label>
					<g:textArea name="personSummary" style="width: 500px; height: 100px;" class="text ui-widget-content ui-corner-all"/>
				</fieldset>
				</form>
			</div>