<jq:jquery>
    $("#requestmapList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
	function split( val ) {
			return val.split( /,\s*/ );
		}
		function extractLast( term ) {
			return split( term ).pop();
		}

		$( "#configAttribute" )
			// don't navigate away from the field on tab when selecting an item
			.bind( "keydown", function( event ) {
				if ( event.keyCode === $.ui.keyCode.TAB &&
						$( this ).data( "autocomplete" ).menu.active ) {
					event.preventDefault();
				}
			})
			.autocomplete({
				source: function( request, response ) {
					$.getJSON( "${createLink(controller: 'requestmap', action: 'searchRoleByAuthorityJSON')}", {
						term: extractLast( request.term )
					}, response );
				},
				search: function() {
					// custom minLength
					var term = extractLast( this.value );
					if ( term.length < 2 ) {
						return false;
					}
				},
				focus: function() {
					// prevent value inserted on focus
					return false;
				},
				select: function( event, ui ) {
					var terms = split( this.value );
					// remove the current input
					terms.pop();
					// add the selected item
					terms.push( ui.item.value );
					// add placeholder to get the comma-and-space at the end
					terms.push( "" );
					this.value = terms.join( ", " );
					return false;
				}
			});
	
</jq:jquery>
<div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="url"><g:message code="requestmap.url.label" default="Url" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: requestmapInstance, field: 'url', 'errors')}">
                                    <g:textField name="url" value="${requestmapInstance?.url}" size="80" />
                                </td>
                                <td>&nbsp;
								<g:if
									test="${hasErrors(bean: requestmapInstance, field: 'url', 'errors')}">
									<jqvalui:renderError for="url" style="margin-top: -5px">
										<g:eachError bean="${requestmapInstance}" field="url">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="configAttribute"><g:message code="requestmap.configAttribute.label" default="Config Attribute" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: requestmapInstance, field: 'configAttribute', 'errors')}">
                                    <g:textArea name="configAttribute" value="${requestmapInstance?.configAttribute}" style="width: 500px; height: 150px;"/>
                                </td>
                                <td>&nbsp;
								<g:if
									test="${hasErrors(bean: requestmapInstance, field: 'configAttribute', 'errors')}">
									<jqvalui:renderError for="configAttribute" style="margin-top: -5px">
										<g:eachError bean="${requestmapInstance}" field="configAttribute">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="requestmap.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: requestmapInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" maxlength="150" value="${requestmapInstance?.description}" size="80"/>
                                </td>
                                <td>&nbsp;
								<g:if
									test="${hasErrors(bean: requestmapInstance, field: 'description', 'errors')}">
									<jqvalui:renderError for="description" style="margin-top: -5px">
										<g:eachError bean="${requestmapInstance}" field="description">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="customed"><g:message code="requestmap.customed.label" default="Customed" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: requestmapInstance, field: 'customed', 'errors')}">
                                    <g:checkBox name="customed" value="${requestmapInstance?.customed}" />
                                </td>
                                <td>&nbsp;
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>