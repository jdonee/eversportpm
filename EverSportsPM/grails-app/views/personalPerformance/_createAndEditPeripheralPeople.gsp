<g:set var="entityName" value="${message(code: 'personalPerformance.peripheralPeople.label', default: 'Peripheral People')}" />
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
				var peripheralPeople = $( "#peripheralPeople" ),allFields = $( [] ).add( peripheralPeople ),tips = $( ".validateTips" );
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
				
       			$("#peripheral .del").live('click',function() {
					var delItem=$(this);
					var code=delItem.parent().parent().attr("id").replace("peripheral-","");
					$.getJSON("${createLink(controller:'personalPerformance', action: 'deletePeripheralPeopleByCode')}", { code: code,personalPerformanceId:$("#personalPerformanceId").val() }, 
						function(json){
						if(jQuery.isEmptyObject(json.message)){
							alert(json.error);
						}else{
							alert(json.message);
						  	delItem.parents(".repeat").remove();  
						};
					});
		     	});	
		     	
				$( "#peripheralPeople-form" ).dialog({
					autoOpen: false,
					resizable: false,
					height: 400,
					width: 550,
					modal: true,
					buttons: {
						"${message(code: 'default.button.create.label', default: 'Create')}": function() {
							var bValid = true;
							var peripheralPeopleForm=$(this);
							allFields.removeClass( "ui-state-error" );
							bValid = bValid && checkLength(peripheralPeople, "${message(code: 'personalPerformance.peripheralPeople.label', default: 'Peripheral People')}", 1);	
							if ( bValid ) {
								$.getJSON("${createLink(controller:'personalPerformance', action: 'savePeripheralPeople')}", { peripheralPeople:$("#peripheralPeople").val(),personalPerformanceId:$("#personalPerformanceId").val() },function(json){
									if(!jQuery.isEmptyObject(json)){
										for(var i=0;i < json.length; i++){  
											$( "#peripheral tbody" ).append("<tr id='peripheral-" +json[i].code+"' class='repeat'><td>" + json[i].company + "</td><td>"+json[i].department+"</td><td>"+json[i].user+"</td><td>"+json[i].name+"</td><td>"+json[i].code+"</td><td><button class='del'>${message(code: 'default.button.delete.label', default: 'Delete')}</button></td></tr>" );
										} 
										peripheralPeopleForm.dialog( "close" ); 
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
<div id="peripheralPeople-form" title="<g:message code="default.create.label" args="[entityName]" />">
				<p class="validateTips">${message(code: 'default.form.tips.label', default: 'All form fields are required.')}</p>
				<form>
				<fieldset>
					<label for="peripheralPeople"><g:message code="personalPerformance.peripheralPeople.label" default="Peripheral People" /></label>
					<g:textArea name="peripheralPeople"  style="width: 500px; height: 100px;" class="text ui-widget-content ui-corner-all"/>
					<span class="icon_warn"><g:message code="personalPerformance.peripheralPeople.warn" default="Please enter the job code to select, you can choose many times." /></span>
				</fieldset>
				</form>
			</div>