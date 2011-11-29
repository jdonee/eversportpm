<g:set var="entityName" value="${message(code: 'companyRule.label', default: 'CompanyRule')}" />
<jq:jquery>
				var content = $( "#content" ),companyRuleId=$("#companyRuleId"),allFields = $( [] ).add( content ).add(companyRuleId),tips = $( ".validateTips" );
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
							$("#companyRuleId").val(json.id);
							$("#content").val(json.content);
							$( "#company-form" ).dialog( "open" );
						}
					});
		     	});	
		     	
		     	$("#company .del").live('click',function() {
					var delItem=$(this);
					var id=delItem.parent().parent().attr("id").replace("company-","");
					$.getJSON("${createLink(controller:'companyRule', action: 'deleteCompanyRuleById')}", { id: id }, 
						function(json){
						if(jQuery.isEmptyObject(json.message)){
							alert(json.error);
						}else{
							alert(json.message);
						  	delItem.parents(".repeat").remove();  
						}
					});
		     	});	
		     	
				$( "#company-form" ).dialog({
					autoOpen: false,
					resizable: false,
					height: 300,
					width: 550,
					modal: true,
					buttons: {
						"${message(code: 'default.button.create.label', default: 'Create')}": function() {
							var bValid = true;
							var companyForm=$(this);
							allFields.removeClass( "ui-state-error" );		
							bValid = bValid && checkLength(content, "${message(code: 'companyRule.content.label', default: 'Content')}", 1);	
							if ( bValid ) {
								if(companyRuleId.val()==""||companyRuleId.val().length<=0){
									$.getJSON("${createLink(controller:'companyRule', action: 'saveCompanyRule')}", { content:$("#content").val(),personalPerformanceId:$("#personalPerformanceId").val() },function(json){
									if(!jQuery.isEmptyObject(json)){
										$( "#company tbody" ).append("<tr id='company-" +json.id+"' class='repeat'><td>" + json.content + "</td><td>"+json.customed+"</td><td><button class='update'>${message(code: 'default.button.update.label', default: 'Update')}</button><button class='del'>${message(code: 'default.button.delete.label', default: 'Delete')}</button></td></tr>" ); 
										companyForm.dialog( "close" ); 
										}
									});	
								}else{
									$.getJSON("${createLink(controller:'companyRule', action: 'updateCompanyRule')}", { content:$("#content").val(),companyRuleId:companyRuleId.val() },function(json){
									if(!jQuery.isEmptyObject(json)){
										$("#company-"+json.id).empty().append("<td>" + json.content + "</td><td>"+json.customed+"</td><td><button class='update'>${message(code: 'default.button.update.label', default: 'Update')}</button><button class='del'>${message(code: 'default.button.delete.label', default: 'Delete')}</button></td>");
										companyForm.dialog( "close" ); 
										}
									});
								}
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
					<g:textArea name="content"  style="width: 500px; height: 100px;" class="text ui-widget-content ui-corner-all"/>
				</fieldset>
				</form>
			</div>