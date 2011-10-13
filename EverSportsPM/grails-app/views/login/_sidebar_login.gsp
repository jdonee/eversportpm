<div id='login' title="<g:message code="springSecurity.login.header" default="Please Login.." />">
		<div class='inner'>
			<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
			</g:if>
			<form action="${resource(file: 'j_spring_security_check')}" method='POST' id='loginForm'>
				<p>
					<label for='username'><g:message code="springSecurity.login.username.label" default="Username:" /></label>
					<input type='text' class='text_' name='j_username' id='username' />
				</p>
				<p>
					<label for='password'><g:message code="springSecurity.login.password.label" default="Password:" /></label>
					<input type='password' class='text_' name='j_password' id='password' />
				</p>
				<br/>
				<p style="text-align:center;">
					<input type='submit' value='<g:message code="springSecurity.login.button" default="Login" />' />
				</p>
			</form>
		</div>
	</div>
	<jq:jquery>
		$('#username').focus();
	</jq:jquery>
