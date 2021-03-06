<jq:jquery>
        	$("#userList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
</jq:jquery>
<div class="dialog">
	<table>
		<tbody>

			<tr class="prop">
				<td valign="top" class="name"><label for="username"><g:message
							code="user.username.label" default="Username" />
				</label></td>
				<td valign="top"
					class="value ${hasErrors(bean: userInstance, field: 'username', 'errors')}">
					<g:textField name="username" value="${userInstance?.username}" />
				</td>
				<td>&nbsp;
				<g:if
					test="${hasErrors(bean: userInstance, field: 'username', 'errors')}">
					<jqvalui:renderError for="username" style="margin-top: -5px">
						<g:eachError bean="${userInstance}" field="username">
							<g:message error="${it}" />
						</g:eachError>
					</jqvalui:renderError>
				</g:if>
				</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="password"><g:message
							code="user.password.label" default="Password" />
				</label></td>
				<td valign="top"
					class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
					<g:passwordField name="password" value="${userInstance?.password}" />
				</td>
				<td>&nbsp;
				<g:if
					test="${hasErrors(bean: userInstance, field: 'password', 'errors')}">
					<jqvalui:renderError for="password" style="margin-top: -5px">
						<g:eachError bean="${userInstance}" field="password">
							<g:message error="${it}" />
						</g:eachError>
					</jqvalui:renderError>
				</g:if>
				</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for=employeeName><g:message
							code="user.employeeName.label" default="Employee Name" />
				</label></td>
				<td valign="top"
					class="value ${hasErrors(bean: userInstance, field: 'employeeName', 'errors')}">
					<g:textField name="employeeName" value="${userInstance?.employeeName}" />
				</td>
				<td>&nbsp;
				<g:if
					test="${hasErrors(bean: userInstance, field: 'employeeName', 'errors')}">
					<jqvalui:renderError for="employeeName" style="margin-top: -5px">
						<g:eachError bean="${userInstance}" field="employeeName">
							<g:message error="${it}" />
						</g:eachError>
					</jqvalui:renderError>
				</g:if>
				</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="email"><g:message
							code="user.email.label" default="Email" />
				</label></td>
				<td valign="top"
					class="value ${hasErrors(bean: userInstance, field: 'email', 'errors')}">
					<g:textField name="email" value="${userInstance?.email}"/></td>
				<td>&nbsp;
				<g:if
					test="${hasErrors(bean: userInstance, field: 'email', 'errors')}">
					<jqvalui:renderError for="email" style="margin-top: -5px">
						<g:eachError bean="${userInstance}" field="email">
							<g:message error="${it}" />
						</g:eachError>
					</jqvalui:renderError>
				</g:if>
				</td>
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><label for="roles"><g:message
							code="user.roles.label" default="Roles" />
				</label></td>
				<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'roles', 'errors')}">
					<g:each in="${roleInstanceList}" var="vr">
					<g:if test="${userInstance?.id!=null}">
						<g:checkBox name="roles" value="${vr.id}" checked="${userInstance.authorities.contains(vr)}"/>&nbsp;<span>${vr?.encodeAsHTML()}</span>
					</g:if>
					<g:else>
						<g:checkBox name="roles" value="${vr.id}"/>&nbsp;<span>${vr?.encodeAsHTML()}</span>
					</g:else>	
					</g:each>
				<td>&nbsp;</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="accountExpired"><g:message
							code="user.accountExpired.label" default="Account Expired" />
				</label></td>
				<td valign="top"
					class="value ${hasErrors(bean: userInstance, field: 'accountExpired', 'errors')}">
					<g:checkBox name="accountExpired"
						value="${userInstance?.accountExpired}" /></td>
				<td>&nbsp;</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="accountLocked"><g:message
							code="user.accountLocked.label" default="Account Locked" />
				</label></td>
				<td valign="top"
					class="value ${hasErrors(bean: userInstance, field: 'accountLocked', 'errors')}">
					<g:checkBox name="accountLocked"
						value="${userInstance?.accountLocked}" /></td>
				<td>&nbsp;</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="enabled"><g:message
							code="user.enabled.label" default="Enabled" />
				</label></td>
				<td valign="top"
					class="value ${hasErrors(bean: userInstance, field: 'enabled', 'errors')}">
					<g:checkBox name="enabled" value="${userInstance?.enabled}" /></td>
				<td>&nbsp;</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="passwordExpired"><g:message
							code="user.passwordExpired.label" default="Password Expired" />
				</label></td>
				<td valign="top"
					class="value ${hasErrors(bean: userInstance, field: 'passwordExpired', 'errors')}">
					<g:checkBox name="passwordExpired"
						value="${userInstance?.passwordExpired}" /></td>
				<td>&nbsp;</td>
			</tr>
		</tbody>
	</table>
</div>