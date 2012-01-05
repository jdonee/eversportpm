<jq:jquery>
				var password = $( "#password" ),allFields = $( [] ).add(password),tips = $( ".validateTips" );
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
		     	
				$( "#pwd-form" ).dialog({
					autoOpen: false,
					resizable: false,
					height: 225,
					width: 450,
					modal: true,
					buttons: {
						"${message(code: 'personInfo.changePwd.label', default: 'Change PWD')}": function() {
							var bValid = true;
							var pwdForm=$(this);
							allFields.removeClass( "ui-state-error" );		
							bValid = bValid && checkLength(password, "${message(code: 'user.password.label', default: 'Password')}", 1);
							if ( bValid ) {
									$.getJSON("${createLink(controller:'personInfo', action: 'changePwd')}", { password:password.val()},function(json){
									if(!jQuery.isEmptyObject(json)){
										$("div .body").prepend("<div class='message'>"+json.message+"</div>");
										pwdForm.dialog( "close" ); 
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
<div id="pwd-form" title="${message(code: 'personInfo.changePwd.label', default: 'Change PWD')}">
				<p class="validateTips">${message(code: 'default.form.tips.label', default: 'All form fields are required.')}</p>
				<form>
				<fieldset>
					<label for="password"><g:message code="user.password.label" default="Password" /></label>
					<g:passwordField name="password" class="text ui-widget-content ui-corner-all" />
				</fieldset>
				</form>
			</div>