<jq:jquery>
        	$("#departmentList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
        </jq:jquery>
<div class="dialog">
                    <table>
                        <tbody>
                        	 <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="company"><g:message code="department.company.label" default="company" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: departmentInstance, field: 'company', 'errors')}">
                                    <g:select name="company.id" from="${com.jdonee.Company.findAllByClosed(Boolean.FALSE)}" optionKey="id" value="${departmentInstance?.company?.id}"  />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="department.name.label" default="name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: departmentInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="50" value="${departmentInstance?.name}" />
                                </td>
                                <td>&nbsp;
								<g:if
									test="${hasErrors(bean: departmentInstance, field: 'name', 'errors')}">
									<jqvalui:renderError for="name" style="margin-top: -5px">
										<g:eachError bean="${departmentInstance}" field="name">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="code"><g:message code="department.code.label" default="code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: departmentInstance, field: 'code', 'errors')}">
                                    <g:textField name="code" maxlength="50" value="${departmentInstance?.code}" />
                                    <span class="icon_warn"><g:message code="department.code.warn" default="code must be is a integer,for example '0101'" /></span>
                                </td>
                                <td>&nbsp;
								<g:if
									test="${hasErrors(bean: departmentInstance, field: 'code', 'errors')}">
									<jqvalui:renderError for="code" style="margin-top: -5px">
										<g:eachError bean="${departmentInstance}" field="code">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="department.description.label" default="description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: departmentInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" value="${departmentInstance?.description}" maxlength="150" class="text" style="width: 500px; height: 200px;"/>
                                </td>
                                <td>&nbsp;
								<g:if
									test="${hasErrors(bean: departmentInstance, field: 'description', 'errors')}">
									<jqvalui:renderError for="description" style="margin-top: -5px">
										<g:eachError bean="${departmentInstance}" field="description">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>                       
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="closed"><g:message code="department.closed.label" default="closed" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: departmentInstance, field: 'closed', 'errors')}">
                                    <g:checkBox name="closed" value="${departmentInstance?.closed}" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                </div>