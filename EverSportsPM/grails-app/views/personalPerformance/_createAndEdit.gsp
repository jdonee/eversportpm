<link rel="stylesheet" href="${resource(dir:'js/select-autocomplete',file:'autocomplete.css')}"/>
<g:javascript src="select-autocomplete/jquery.autocomplete.js"/>
<g:javascript src="select-autocomplete/jquery.select-autocomplete.js"/>
<jq:jquery>
        $("#personalPerformanceList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
        $('select.autocomplete').select_autocomplete({width:'300px'});
    	$('select.autocomplete').show();
</jq:jquery>
<div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="performance"><g:message code="personalPerformance.performance.label" default="Performance" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'performance', 'errors')}">
                                    <g:select name="performance.id" from="${com.jdonee.Performance.findAllByClosed(Boolean.FALSE)}" optionKey="id" value="${personalPerformanceInstance?.performance?.id}"  />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="job"><g:message code="personalPerformance.job.label" default="Job" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'job', 'errors')}">
                                    <g:select name="job.id" class="autocomplete" from="${jobInstanceList}" optionKey="id" value="${personalPerformanceInstance?.job?.id}"  />
                                </td>
                                <td>&nbsp;</td>
                            </tr>                                              
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="peripheralPeople"><g:message code="personalPerformance.peripheralPeople.label" default="Peripheral People" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'peripheralPeople', 'errors')}">
                                    <g:textArea name="peripheralPeople" value="${personalPerformanceInstance?.peripheralPeople}" style="width: 500px; height: 150px;"/>
                                </td>
                               <jq:jquery>
						        function split( val ) {
									return val.split( /,\s*/ );
								}
								function extractLast( term ) {
									return split( term ).pop();
								}
								$( "#peripheralPeople" )
									// don't navigate away from the field on tab when selecting an item
									.bind( "keydown", function( event ) {
										if ( event.keyCode === $.ui.keyCode.TAB &&
												$( this ).data( "autocomplete" ).menu.active ) {
											event.preventDefault();
										}
									})
									.autocomplete({
										source: function( request, response ) {
											$.getJSON( "${createLink(controller: 'personalPerformance', action: 'searchJobByCodeJSON')}", {
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
                                <td>&nbsp;
								<g:if test="${hasErrors(bean: personalPerformanceInstance, field: 'peripheralPeople', 'errors')}">
									<jqvalui:renderError for="peripheralPeople" style="margin-top: -5px">
										<g:eachError bean="${personalPerformanceInstance}" field="peripheralPeople">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>                                                                                                 
                        	<tr><td colspan="3">&nbsp;</td></tr>
                            <tr><td colspan="3">&nbsp;</td></tr>
                            <tr><td colspan="3">&nbsp;</td></tr>
                            <tr><td colspan="3">&nbsp;</td></tr>
                        </tbody>
                    </table>
</div>