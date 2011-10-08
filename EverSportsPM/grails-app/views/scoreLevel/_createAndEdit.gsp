              <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="level"><g:message code="scoreLevel.level.label" default="Level" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: scoreLevelInstance, field: 'level', 'errors')}">
                                    <g:textField name="level" maxlength="2" value="${scoreLevelInstance?.level}" />
                                </td>
                                <td>&nbsp;
								<g:if
									test="${hasErrors(bean: scoreLevelInstance, field: 'level', 'errors')}">
									<jqvalui:renderError for="level" style="margin-top: -5px">
										<g:eachError bean="${scoreLevelInstance}" field="level">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="minValue"><g:message code="scoreLevel.minValue.label" default="Min Value" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: scoreLevelInstance, field: 'minValue', 'errors')}">
                                    <g:textField name="minValue" value="${fieldValue(bean: scoreLevelInstance, field: 'minValue')}" />
                                </td>
                                <td>&nbsp;
								<g:if
									test="${hasErrors(bean: scoreLevelInstance, field: 'minValue', 'errors')}">
									<jqvalui:renderError for="minValue" style="margin-top: -5px">
										<g:eachError bean="${scoreLevelInstance}" field="minValue">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="maxValue"><g:message code="scoreLevel.maxValue.label" default="Max Value" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: scoreLevelInstance, field: 'maxValue', 'errors')}">
                                    <g:textField name="maxValue" value="${fieldValue(bean: scoreLevelInstance, field: 'maxValue')}" />
                                </td>
                                <td>&nbsp;
								<g:if
									test="${hasErrors(bean: scoreLevelInstance, field: 'maxValue', 'errors')}">
									<jqvalui:renderError for="maxValue" style="margin-top: -5px">
										<g:eachError bean="${scoreLevelInstance}" field="maxValue">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>  
                        </tbody>
                    </table>
                </div>