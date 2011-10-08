<div class="dialog">
	<table>
		<tbody>
			<tr class="prop">
				<td valign="top" class="name"><label for="authority"><g:message
							code="role.authority.label" default="authority" />
				</label></td>
				<td valign="top"
					class="value ${hasErrors(bean: roleInstance, field: 'Authority', 'errors')}">
					<g:if test="${roleInstance?.admin}">
					<g:textField name="authority" value="${roleInstance?.authority}" readOnly="true" />
					</g:if>
					<g:else>
					<g:textField name="authority" value="${roleInstance?.authority}"  />
					</g:else>
					<span class="icon_warn"><g:message code="role.authority.warn" default="authority must start with 'ROLE_',and must use capital letter." /></span>
				</td>
				<td>&nbsp;
					<g:if
						test="${hasErrors(bean: roleInstance, field: 'authority', 'errors')}">
						<jqvalui:renderError for="authority" style="margin-top: -5px">
							<g:eachError bean="${roleInstance}" field="authority">
								<g:message error="${it}" />
							</g:eachError>
						</jqvalui:renderError>
					</g:if>
				</td>
			</tr>
			 <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="alias"><g:message code="role.alias.label" default="Alias" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: roleInstance, field: 'alias', 'errors')}">
                                    <g:textField name="alias" value="${roleInstance?.alias}" />
                                </td>
                                <td>
					<g:if
						test="${hasErrors(bean: roleInstance, field: 'alias', 'errors')}">
						<jqvalui:renderError for="alias" style="margin-top: -5px">
							<g:eachError bean="${roleInstance}" field="alias">
								<g:message error="${it}" />
							</g:eachError>
						</jqvalui:renderError>
					</g:if>
				</td>
             </tr>
			<tr class="prop">
				<td valign="top" class="name"><label for="description"><g:message
							code="role.description.label" default="Description" />
				</label></td>
				<td valign="top" class="value ${hasErrors(bean: roleInstance, field: 'description', 'errors')}">
					<g:textArea name="description" maxlength="100" value="${roleInstance?.description}" class="text" style="width: 500px; height: 200px;"/>
					</td>
				<td>&nbsp;<g:if
						test="${hasErrors(bean: roleInstance, field: 'description', 'errors')}">
						<jqvalui:renderError for="description" style="margin-top: -5px">
							<g:eachError bean="${roleInstance}" field="description">
								<g:message error="${it}" />
							</g:eachError>
						</jqvalui:renderError>
					</g:if></td>
			</tr>

		</tbody>
	</table>
</div>

