<jq:jquery>
        	$("#performanceList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
</jq:jquery>
<div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="performance.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: performanceInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="50" value="${performanceInstance?.name}" />
                                </td>
                                <td>&nbsp;
								<g:if test="${hasErrors(bean: performanceInstance, field: 'name', 'errors')}">
									<jqvalui:renderError for="name" style="margin-top: -5px">
										<g:eachError bean="${performanceInstance}" field="name">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate"><g:message code="performance.startDate.label" default="Start Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: performanceInstance, field: 'startDate', 'errors')}">
                                    <g:datePicker name="startDate" precision="day" value="${performanceInstance?.startDate}" years="${2010..2050}" />
                                    <%--<g:jqDatePicker name="startDate" value="${performanceInstance?.startDate}" minDate="new Date()"></g:jqDatePicker> --%>
                                </td>
                                 <td>&nbsp;
								<g:if test="${hasErrors(bean: performanceInstance, field: 'startDate', 'errors')}">
									<jqvalui:renderError for="startDate" style="margin-top: -5px">
										<g:eachError bean="${performanceInstance}" field="startDate">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate"><g:message code="performance.endDate.label" default="End Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: performanceInstance, field: 'endDate', 'errors')}">
                                    <g:datePicker name="endDate" precision="day" value="${performanceInstance?.endDate}" years="${2010..2050}" />
                                    <%--<g:jqDatePicker name="endDate" value="${performanceInstance?.endDate}" minDate="new Date()"></g:jqDatePicker>--%>
                                </td>
                                <td>&nbsp;
								<g:if test="${hasErrors(bean: performanceInstance, field: 'endDate', 'errors')}">
									<jqvalui:renderError for="endDate" style="margin-top: -5px">
										<g:eachError bean="${performanceInstance}" field="endDate">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mainWeight"><g:message code="performance.mainWeight.label" default="Main Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: performanceInstance, field: 'mainWeight', 'errors')}">
                                    <g:textField name="mainWeight" value="${fieldValue(bean: performanceInstance, field: 'mainWeight')}" />
                                </td>
                                <td>&nbsp;
								<g:if test="${hasErrors(bean: performanceInstance, field: 'mainWeight', 'errors')}">
									<jqvalui:renderError for="mainWeight" style="margin-top: -5px">
										<g:eachError bean="${performanceInstance}" field="mainWeight">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="auxiliaryWeight"><g:message code="performance.auxiliaryWeight.label" default="Auxiliary Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: performanceInstance, field: 'auxiliaryWeight', 'errors')}">
                                    <g:textField name="auxiliaryWeight" value="${fieldValue(bean: performanceInstance, field: 'auxiliaryWeight')}" />
                                </td>
                                <td>&nbsp;
								<g:if test="${hasErrors(bean: performanceInstance, field: 'auxiliaryWeight', 'errors')}">
									<jqvalui:renderError for="auxiliaryWeight" style="margin-top: -5px">
										<g:eachError bean="${performanceInstance}" field="auxiliaryWeight">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="peripheralWeight"><g:message code="performance.peripheralWeight.label" default="Peripheral Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: performanceInstance, field: 'peripheralWeight', 'errors')}">
                                    <g:textField name="peripheralWeight" value="${fieldValue(bean: performanceInstance, field: 'peripheralWeight')}" />
                                </td>
                                 <td>&nbsp;
								<g:if test="${hasErrors(bean: performanceInstance, field: 'peripheralWeight', 'errors')}">
									<jqvalui:renderError for="peripheralWeight" style="margin-top: -5px">
										<g:eachError bean="${performanceInstance}" field="peripheralWeight">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="performance.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: performanceInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" maxlength="150" value="${performanceInstance?.description}" class="text" style="width: 500px; height: 200px;"/>
                                </td>
                                 <td>&nbsp;
								<g:if test="${hasErrors(bean: performanceInstance, field: 'description', 'errors')}">
									<jqvalui:renderError for="description" style="margin-top: -5px">
										<g:eachError bean="${performanceInstance}" field="description">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="useTemplate"><g:message code="performance.useTemplate.label" default="Use Template" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: performanceInstance, field: 'useTemplate', 'errors')}">
                                    <g:checkBox name="useTemplate" value="${performanceInstance?.useTemplate}" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="closed"><g:message code="performance.closed.label" default="Closed" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: performanceInstance, field: 'closed', 'errors')}">
                                    <g:checkBox name="closed" value="${performanceInstance?.closed}" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
</div>