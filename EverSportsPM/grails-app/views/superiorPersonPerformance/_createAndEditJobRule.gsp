<g:set var="entityName" value="${message(code: 'jobRule.label', default: 'JobRule')}" />
<jq:jquery>
			var jobItem = $( "#jobItem" ),jobRuleId=$("#jobRuleId"),personSummary = $( "#personSummary" ),peripheralScore=$("#peripheralScore"),score=$("#score"),expectation = $( "#jExpectation" ),
			allFields = $([]).add(jobItem).add(personSummary).add(score).add(expectation).add(peripheralScore).add(jobRuleId),
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
			
			$("#job .update").live('click',function() {
					var updateItem=$(this);
					var id=updateItem.parent().parent().attr("id").replace("job-","");
					$.getJSON("${createLink(controller:'jobRule', action: 'getJobRuleById')}", { id: id }, 
						function(json){
						if(!jQuery.isEmptyObject(json)){
							jobRuleId.val(json.id);
							jobItem.html(json.jobItem);
							personSummary.html(json.personSummary);
							peripheralScore.html(json.peripheralScore);
							score.val(json.score);
							expectation.val(json.expectation);
							$( "#job-form" ).dialog( "open" );
						}
					});
		     	});	
		     	
			$( "#job-form" ).dialog({
					autoOpen: false,
					resizable: false,
					height: 600,
					width: 550,
					modal: true,
					buttons: {
						"${message(code: 'default.button.create.label', default: 'Create')}": function() {
							var bValid = true;
							var jobForm=$(this);
							allFields.removeClass( "ui-state-error" );		
							bValid = bValid && checkLength( expectation, "${message(code:'jobRule.expectation.label',default:'Expectation')}",1);
							bValid = bValid && checkLength( score, "${message(code:'jobRule.score.label',default:'Score')}", 1);
							bValid = bValid && checkValue( score, "${message(code:'jobRule.score.label',default:'Score')}", 0,100);			
							bValid = bValid && checkRegexp( score, /^([0-9])+$/, "${message(code:'jobRule.score.validate.label',default:'Score field only allow :0-9')}" );				
							if ( bValid ) {
									$.getJSON("${createLink(controller:'jobRule', action: 'updateJobRule')}", { score:score.val(),expectation:expectation.val(),jobRuleId:jobRuleId.val() },function(json){
									if(!jQuery.isEmptyObject(json)){
										$("#job-"+json.id).empty().append("<td>" + json.jobItem + "</td><td>" + json.personSummary + "</td><td>" + json.peripheralScore + "</td><td>" + json.score + "</td><td>" + json.expectation + "</td><td>"+json.customed+"</td><td><button class='update'>${message(code: 'default.button.summary.label', default: 'Summary')}</button></td>");
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
					<p id="personSummary" class="text ui-widget-content ui-corner-all"></p>
					<label for="peripheralScore"><g:message code="jobRule.peripheralScore.label" default="Peripheral Score" /></label>
					<p id="peripheralScore" class="text ui-widget-content ui-corner-all"></p>
					<label for="score"><g:message code="jobRule.score.label" default="Score" /></label>
					<g:textField name="score" class="text ui-widget-content ui-corner-all"/><span>(${message(code: 'personalPerformance.score.info.label', default: '100 Points out.')})</span>
					<label for="expectation"><g:message code="jobRule.expectation.label" default="Expectation" /></label>
					<g:textArea name="jExpectation" style="width: 500px; height: 100px;" class="text ui-widget-content ui-corner-all"/>					
				</fieldset>
				</form>
			</div>