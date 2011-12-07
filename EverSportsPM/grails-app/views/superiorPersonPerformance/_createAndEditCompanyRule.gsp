<g:set var="entityName" value="${message(code: 'companyRule.label', default: 'CompanyRule')}" />
<jq:jquery>
				var content = $( "#content" ),personSummary = $( "#cPersonSummary" ),appraise = $( "#appraise" ),expectation = $( "#expectation" ),companyRuleId=$("#companyRuleId"),
				allFields = $( [] ).add(content).add(personSummary).add(appraise).add(expectation).add(companyRuleId),tips = $( ".validateTips" );
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
				
       			$("#company .update").live('click',function() {
					var updateItem=$(this);
					var id=updateItem.parent().parent().attr("id").replace("company-","");
					$.getJSON("${createLink(controller:'companyRule', action: 'getCompanyRuleById')}", { id: id }, 
						function(json){
						if(!jQuery.isEmptyObject(json)){
							companyRuleId.val(json.id);
							content.html(json.content);
							personSummary.html(json.personSummary);
							appraise.val(json.appraise);
							expectation.val(json.expectation);
							$( "#company-form" ).dialog( "open" );
						}
					});
		     	});	
		     	
				$( "#company-form" ).dialog({
					autoOpen: false,
					resizable: false,
					height: 500,
					width: 550,
					modal: true,
					buttons: {
						"${message(code: 'default.button.create.label', default: 'Create')}": function() {
							var bValid = true;
							var companyForm=$(this);
							allFields.removeClass( "ui-state-error" );		
							bValid = bValid && checkLength(appraise, "${message(code: 'companyRule.appraise.label', default: 'Appraise')}", 1);
							bValid = bValid && checkLength(expectation, "${message(code: 'companyRule.expectation.label', default: 'Expectation')}", 1);	
							if ( bValid ) {
									$.getJSON("${createLink(controller:'companyRule', action: 'updateCompanyRule')}", { appraise:appraise.val(),expectation:expectation.val(),companyRuleId:companyRuleId.val() },function(json){
									if(!jQuery.isEmptyObject(json)){
										$("#company-"+json.id).empty().append("<td>" + json.content + "</td><td>" + json.personSummary + "</td><td>" + json.appraise + "</td><td>" + json.expectation + "</td><td>"+json.customed+"</td><td><button class='update'>${message(code: 'default.button.summary.label', default: 'Summary')}</button></td>");
										companyForm.dialog( "close" ); 
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
<div id="company-form" title="<g:message code="default.create.label" args="[entityName]" />">
				<p class="validateTips">${message(code: 'default.form.tips.label', default: 'All form fields are required.')}</p>
				<form>
				<g:hiddenField name="companyRuleId"/>
				<fieldset>
					<label for="content"><g:message code="companyRule.content.label" default="Content" /></label>
					<p id="content" class="text ui-widget-content ui-corner-all"></p>
					<label for="personSummary"><g:message code="companyRule.personSummary.label" default="Person Summary" /></label>
					<p id="cPersonSummary" class="text ui-widget-content ui-corner-all"></p>
					<label for="appraise"><g:message code="companyRule.appraise.label" default="Content" /></label>
					<g:textArea name="appraise"  style="width: 500px; height: 100px;" class="text ui-widget-content ui-corner-all"/>
					<label for="expectation"><g:message code="companyRule.expectation.label" default="Content" /></label>
					<g:textArea name="expectation"  style="width: 500px; height: 100px;" class="text ui-widget-content ui-corner-all"/>
				</fieldset>
				</form>
			</div>