<g:set var="entityName" value="${message(code: 'kpiRule.label', default: 'KpiRule')}" />
<jq:jquery>
			var desiredItem = $( "#desiredItem" ),targetValue = $( "#targetValue" ),description = $( "#description" ),weight = $( "#weight" ),
			allFields = $( [] ).add( desiredItem ).add( targetValue ).add( description ).add(weight),tips = $( ".validateTips" );
			function checkRegexp( o, regexp, n ) {
				if ( !( regexp.test( o.val() ) ) ) {
					o.addClass( "ui-state-error" );
					updateTips( n );
					return false;
				} else {
					return true;
				}
			}
			
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
			
			function checkValue(o,n,minVal,maxVal){
				if(parseInt(o.val())< minVal || parseInt(o.val())> maxVal){
					o.addClass( "ui-state-error" );
					updateTips( n + "${message(code: 'default.js.checkValue.message', default: 'must fall within the valid range:')}"+"["+minVal+"~"+maxVal+"]" );
					return false;
				}else{
					return true;
				}
			}
			
	       $("#kpi .del").live('click',function() {
	       			if(confirm("${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}")){
						var delItem=$(this);
						var id=delItem.parent().parent().attr("id").replace("kpi-","");
						$.getJSON("${createLink(controller:'personalPerformance', action: 'deleteKpiRuleById')}", { id: id }, 
							function(json){
							if(json.message.length>0){
							  	alert(json.message);
							  	delItem.parents(".repeat").remove();  
						  	}else{
						  		alert(json.error);
						  	}
						});
						}
			});

			$( "#kpi-form" ).dialog({
					autoOpen: false,
					resizable: false,
					height: 400,
					width: 550,
					modal: true,
					buttons: {
						"${message(code: 'default.button.create.label', default: 'Create')}": function() {
							var bValid = true;
							var kpiForm=$(this);
							allFields.removeClass( "ui-state-error" );		
							bValid = bValid && checkLength( desiredItem, "${message(code:'kpiRule.desiredItem.label',default:'Desired Item')}", 1);
							bValid = bValid && checkLength( targetValue, "${message(code:'kpiRule.targetValue.label',default:'Target Value')}",1);
							bValid = bValid && checkLength( weight, "${message(code:'kpiRule.weight.label',default:'Weight')}", 1);
							bValid = bValid && checkValue( weight, "${message(code:'kpiRule.weight.label',default:'Weight')}", 0,100);			
							bValid = bValid && checkRegexp( weight, /^([0-9])+$/, "${message(code:'kpiRule.weight.validate.label',default:'Weight field only allow :0-9')}" );		
							if ( bValid ) {
								$.getJSON("${createLink(controller:'personalPerformance', action: 'saveKpiRule')}",
								 { desiredItem:$("#desiredItem").val(),targetValue:$("#targetValue").val(),
								 description:$("#description").val(),weight:$("#weight").val(),
								 personalPerformanceId:$("#personalPerformanceId").val() },
								 function(json){
									if(!jQuery.isEmptyObject(json)){
										$( "#kpi tbody" ).append("<tr id='kpi-" +json.id+"' class='repeat'><td>" + json.desiredItem + "</td><td>"+json.targetValue+"</td><td>"+json.description+"</td><td>"+json.weight+"</td><td><button class='del'>${message(code: 'default.button.delete.label', default: 'Delete')}</button></td></tr>" ); 
										kpiForm.dialog( "close" ); 
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
<div id="kpi-form" title="<g:message code="default.create.label" args="[entityName]" />">
				<p class="validateTips">${message(code: 'default.form.tips.label', default: 'All form fields are required.')}</p>
				<form>
				<fieldset>
					<label for="desiredItem"><g:message code="kpiRule.desiredItem.label" default="Desired Item" /></label>
					<g:textArea name="desiredItem" style="width: 500px; height: 50px;" class="text ui-widget-content ui-corner-all"/>
					<label for="targetValue"><g:message code="kpiRule.targetValue.label" default="Target Value" /></label>
					<g:textArea name="targetValue" style="width: 500px; height: 50px;" class="text ui-widget-content ui-corner-all"/>
					<label for="description"><g:message code="kpiRule.description.label" default="Description" /></label>
					<g:textArea name="description" style="width: 500px; height: 50px;" class="text ui-widget-content ui-corner-all"/>
					<label for="weight"><g:message code="kpiRule.weight.label" default="Weight" /></label>
					<g:textField name="weight" class="text ui-widget-content ui-corner-all"/>
				</fieldset>
				</form>
</div>