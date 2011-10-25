 <jq:jquery>
        	$("#systemTemplateList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
</jq:jquery>
 <div class="dialog">
                    <table>
                        <tbody>                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="templateType"><g:message code="systemTemplate.templateType.label" default="Template Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: systemTemplateInstance, field: 'templateType', 'errors')}">
                                    <g:select name="templateType" from="${com.jdonee.utils.TemplateType?.values()}" keys="${com.jdonee.utils.TemplateType?.values()*.name()}" value="${systemTemplateInstance?.templateType?.name()}"  />
                                </td>
                                <td>&nbsp;
								<g:if
									test="${hasErrors(bean: systemTemplateInstance, field: 'templateType', 'errors')}">
									<jqvalui:renderError for="templateType" style="margin-top: -5px">
										<g:eachError bean="${systemTemplateInstance}" field="templateType">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="templateContent"><g:message code="systemTemplate.templateContent.label" default="Template Content" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: systemTemplateInstance, field: 'templateContent', 'errors')}">
                                    <g:textArea name="templateContent" class="text"  value="${systemTemplateInstance?.templateContent}" style="width: 500px; height: 200px;"/>
									<br/>
									<span class="icon_warn"><g:message code="systemTemplate.templateContent.warn" default="If multiple records , must using '||' symbol to split." /></span>
                                </td>
                                <td>&nbsp;
								<g:if
									test="${hasErrors(bean: systemTemplateInstance, field: 'templateContent', 'errors')}">
									<jqvalui:renderError for="templateContent" style="margin-top: -5px">
										<g:eachError bean="${systemTemplateInstance}" field="templateContent">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="enabled"><g:message code="systemTemplate.enabled.label" default="Enabled" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: systemTemplateInstance, field: 'enabled', 'errors')}">
                                    <g:checkBox name="enabled" value="${systemTemplateInstance?.enabled}" />
                                </td>
                                <td>&nbsp;
								<g:if
									test="${hasErrors(bean: systemTemplateInstance, field: 'enabled', 'errors')}">
									<jqvalui:renderError for="enabled" style="margin-top: -5px">
										<g:eachError bean="${systemTemplateInstance}" field="enabled">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>                        
                        </tbody>
                    </table>
</div>