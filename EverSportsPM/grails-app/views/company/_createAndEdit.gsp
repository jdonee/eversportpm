<div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="company.name.label" default="name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="50" value="${companyInstance?.name}" />
                                </td>
                                <td>&nbsp;
								<g:if
									test="${hasErrors(bean: companyInstance, field: 'name', 'errors')}">
									<jqvalui:renderError for="name" style="margin-top: -5px">
										<g:eachError bean="${companyInstance}" field="name">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="code"><g:message code="company.code.label" default="code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'code', 'errors')}">
                                    <g:textField name="code" maxlength="50" value="${companyInstance?.code}" />
                                    <span class="icon_warn"><g:message code="company.code.warn" default="code must be is a integer,for example '01'" /></span>
                                </td>
                                <td>&nbsp;
								<g:if
									test="${hasErrors(bean: companyInstance, field: 'code', 'errors')}">
									<jqvalui:renderError for="code" style="margin-top: -5px">
										<g:eachError bean="${companyInstance}" field="code">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="company.description.label" default="description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'description', 'errors')}">
                                	<g:textArea name="description" value="${companyInstance?.description}" maxlength="150" class="text" style="width: 500px; height: 200px;"/>
                                </td>
                                <td>
								<g:if
									test="${hasErrors(bean: companyInstance, field: 'description', 'errors')}">
									<jqvalui:renderError for="description" style="margin-top: -5px">
										<g:eachError bean="${companyInstance}" field="description">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="closed"><g:message code="company.closed.label" default="closed" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'closed', 'errors')}">
                                    <g:checkBox name="closed" value="${companyInstance?.closed}" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>