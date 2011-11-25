<g:set var="entityName" value="${message(code: 'jobRule.label', default: 'JobRule')}" />
<jq:jquery>
			var jobItem = $( "#jobItem" ),jobRuleId=$("#jobRuleId"),allFields = $( [] ).add( jobItem ).add(jobRuleId),tips = $( ".validateTips" );
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
					$.getJSON("${createLink(controller:'personalPerformance', action: 'getJobRuleById')}", { id: id }, 
						function(json){
						if(!jQuery.isEmptyObject(json)){
							$("#jobRuleId").val(json.id);
							$("#jobItem").val(json.jobItem);
							$( "#job-form" ).dialog( "open" );
						}
					});
		     	});	
			
			$("#job .del").live('click',function() {
					var delItem=$(this);
					var id=delItem.parent().parent().attr("id").replace("job-","");
					$.getJSON("${createLink(controller:'personalPerformance', action: 'deleteJobRuleById')}", { id: id }, 
						function(json){
						if(jQuery.isEmptyObject(json.message)){
							alert(json.error);
						}else{
							alert(json.message);
						  	delItem.parents(".repeat").remove();  
						}; 
					});
		        });
			$( "#job-form" ).dialog({
					autoOpen: false,
					resizable: false,
					height: 300,
					width: 550,
					modal: true,
					buttons: {
						"${message(code: 'default.button.create.label', default: 'Create')}": function() {
							var bValid = true;
							var jobForm=$(this);
							allFields.removeClass( "ui-state-error" );		
							bValid = bValid && checkLength(jobItem, "${message(code: 'jobRule.jobItem.label', default: 'Job Item')}", 1);		
							if ( bValid ) {
								if(jobRuleId.val()==""||jobRuleId.val().length<=0){
									$.getJSON("${createLink(controller:'personalPerformance', action: 'saveJobRule')}", { jobItem:$("#jobItem").val(),personalPerformanceId:$("#personalPerformanceId").val() },function(json){
									if(!jQuery.isEmptyObject(json)){
										$( "#job tbody" ).append("<tr id='job-" +json.id+"' class='repeat'><td>" + json.jobItem + "</td><td>"+json.customed+"</td><td><button class='update'>${message(code: 'default.button.update.label', default: 'Update')}</button><button class='del'>${message(code: 'default.button.delete.label', default: 'Delete')}</button></td></tr>" ); 
										jobForm.dialog( "close" ); 
										}
									});	
								}else{
									$.getJSON("${createLink(controller:'personalPerformance', action: 'updateJobRule')}", { jobItem:$("#jobItem").val(),jobRuleId:jobRuleId.val() },function(json){
									if(!jQuery.isEmptyObject(json)){
										$("#job-"+json.id).empty().append("<td>" + json.jobItem + "</td><td>"+json.customed+"</td><td><button class='update'>${message(code: 'default.button.update.label', default: 'Update')}</button><button class='del'>${message(code: 'default.button.delete.label', default: 'Delete')}</button></td>");
										jobForm.dialog( "close" ); 
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
		<div id="job-form" title="<g:message code="default.create.label" args="[entityName]" />">
				<p class="validateTips">${message(code: 'default.form.tips.label', default: 'All form fields are required.')}</p>
				<form>
				<g:hiddenField name="jobRuleId"/>
				<fieldset>
					<label for="jobItem"><g:message code="jobRule.jobItem.label" default="Job Item" /></label>
					<g:textArea name="jobItem" style="width: 500px; height: 100px;" class="text ui-widget-content ui-corner-all"/>
				</fieldset>
				</form>
			</div>