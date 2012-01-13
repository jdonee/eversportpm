<g:set var="entityName" value="${message(code: 'kpiRule.label', default: 'KpiRule')}" />
<jq:jquery>
			var desiredItem = $( "#desiredItem" ),targetValue = $( "#targetValue" ),description = $( "#description" ),weight = $( "#weight" ),
			actualValue=$("#actualValue"),score=$("#score"),kpiRuleId=$("#kpiRuleId"),
			allFields = $([]).add(desiredItem).add(targetValue).add(description).add(weight).add(desiredItem).add(score).add(kpiRuleId),
			tips = $( ".validateTips" );
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
			
			$("#kpi .update").live('click',function() {
					var updateItem=$(this);
					var id=updateItem.parent().parent().attr("id").replace("kpi-","");
					$.getJSON("${createLink(controller:'kpiRule', action: 'getKpiRuleById')}", { id: id }, 
						function(json){
						if(!jQuery.isEmptyObject(json)){
							kpiRuleId.val(json.id);
							desiredItem.html(json.desiredItem);
							targetValue.html(json.targetValue);
							description.html(json.description);
							weight.html(json.weight);
							actualValue.val(json.actualValue);
							score.val(json.score);
							$( "#kpi-form" ).dialog( "open" );
						}
					});
		     });			

			$( "#kpi-form" ).dialog({
					autoOpen: false,
					resizable: false,
					height: 600,
					width: 550,
					modal: true,
					buttons: {
						"${message(code: 'default.button.create.label', default: 'Create')}": function() {
							var bValid = true;
							var kpiForm=$(this);
							allFields.removeClass( "ui-state-error" );
							bValid = bValid && checkLength( actualValue, "${message(code:'kpiRule.actualValue.label',default:'Actual Value')}",1);
							bValid = bValid && checkLength( score, "${message(code:'kpiRule.score.label',default:'Score')}", 1);
							bValid = bValid && checkValue( score, "${message(code:'kpiRule.score.label',default:'Score')}", 0,100);			
							bValid = bValid && checkRegexp( score, /^([0-9])+$/, "${message(code:'kpiRule.score.validate.label',default:'Score field only allow :0-9')}" );		
							if ( bValid ) {
									$.getJSON("${createLink(controller:'kpiRule', action: 'updateKpiRule')}", 
									{ actualValue:actualValue.val(),score:score.val(),kpiRuleId:kpiRuleId.val() },
									function(json){
									if(!jQuery.isEmptyObject(json)){
										$("#kpi-"+json.id).empty().append("<td>" + json.desiredItem + "</td><td>"+json.targetValue+"</td><td>"+json.description+"</td><td>"+json.weight+"</td><td>"+json.actualValue+"</td><td>"+json.score+"</td><td><button class='update'>${message(code: 'default.button.summary.label', default: 'Summary')}</button></td>");
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
				<g:hiddenField name="kpiRuleId"/>
				<fieldset>
					<label for="desiredItem"><g:message code="kpiRule.desiredItem.label" default="Desired Item" /></label>
					<p id="desiredItem" class="text ui-widget-content ui-corner-all"></p>
					<label for="targetValue"><g:message code="kpiRule.targetValue.label" default="Target Value" /></label>
					<p id="targetValue" class="text ui-widget-content ui-corner-all"></p>
					<label for="description"><g:message code="kpiRule.description.label" default="Description" /></label>
					<p id="description" class="text ui-widget-content ui-corner-all"></p>
					<label for="weight"><g:message code="kpiRule.weight.label" default="Weight" /></label>
					<p id="weight" class="text ui-widget-content ui-corner-all"></p>
					<label for="actualValue"><g:message code="kpiRule.actualValue.label" default="Actual Value" /></label>
					<g:textArea name="actualValue" style="width: 500px; height: 50px;" class="text ui-widget-content ui-corner-all"/>
					<label for="score"><g:message code="kpiRule.score.label" default="Score" /></label>
					<g:textField name="score" class="text ui-widget-content ui-corner-all"/><span>(${message(code: 'personalPerformance.score.info.label', default: '100 Points out.')})</span>
				</fieldset>
				</form>
</div>