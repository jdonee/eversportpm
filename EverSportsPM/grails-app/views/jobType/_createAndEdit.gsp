<div class="dialog">
                    <table>
                        <tbody>                       
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="jobType.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobTypeInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${jobTypeInstance?.name}" />
                                </td>
                                <td>&nbsp;
								<g:if test="${hasErrors(bean: jobTypeInstance, field: 'name', 'errors')}">
									<jqvalui:renderError for="name" style="margin-top: -5px">
										<g:eachError bean="${jobTypeInstance}" field="name">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="jobType.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobTypeInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" maxlength="150" value="${jobTypeInstance?.description}" class="text" style="width: 500px; height: 200px;"/>
                                </td>
                                <td>&nbsp;
								<g:if test="${hasErrors(bean: jobTypeInstance, field: 'description', 'errors')}">
									<jqvalui:renderError for="description" style="margin-top: -5px">
										<g:eachError bean="${jobTypeInstance}" field="description">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        </tbody>
                    </table>
                </div>