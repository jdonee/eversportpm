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
                        </tbody>
                    </table>
</div>