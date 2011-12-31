<link rel="stylesheet" href="${resource(dir:'js/select-autocomplete',file:'autocomplete.css')}"/>
<g:javascript src="select-autocomplete/jquery.autocomplete.js"/>
<g:javascript src="select-autocomplete/jquery.select-autocomplete.js"/>
<link rel="stylesheet" href="${resource(dir:'js/jquery-ui-multiselect',file:'jquery.multiselect.css')}" />
<link rel="stylesheet" href="${resource(dir:'js/jquery-ui-multiselect',file:'jquery.multiselect.filter.css')}" />
<g:javascript src="jquery-ui-multiselect/js/jquery.multiselect.js"/>
<g:javascript src="jquery-ui-multiselect/js/jquery.multiselect.filter.js"/>
<jq:jquery>
        $("#personalPerformanceList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
        $.extend($.ech.multiselect.prototype.options, {
			checkAllText: '${message(code: 'multiselect.checkAllText.label')}',
			uncheckAllText: '${message(code: 'multiselect.uncheckAllText.label')}',
			noneSelectedText: '${message(code: 'multiselect.noneSelectedText.label')}',
			selectedText: '${message(code: 'multiselect.selectedText.label')}'
		});
		$.extend($.ech.multiselectfilter.prototype.options, {
			label: '${message(code: 'multiselectfilter.label.label')}',
			placeholder: '${message(code: 'multiselectfilter.placeholder.label')}'
		});
		$currentPeripheralPeople=$("#currentPeripheralPeople");
        if($currentPeripheralPeople.length>0){
                 var currentValues=$currentPeripheralPeople.val().split(',');;
                 $("#peripheralPeople option").each(function(){
	                 if(jQuery.inArray($(this).val(),currentValues)!=-1){
	                        $(this).attr("selected", "true");
	                     }                   
    				});
         };                      		
        $("#peripheralPeople").multiselect({
        	selectedList: 5,
		   	position: {
				      my: 'center',
				      at: 'center'
				   }
				}).multiselectfilter({
					width:100
				});
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
                           <g:hiddenField name="currentPeripheralPeople" value="${personalPerformanceInstance?.peripheralPeople}"/>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="peripheralPeople"><g:message code="personalPerformance.peripheralPeople.label" default="Peripheral People" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personalPerformanceInstance, field: 'peripheralPeople', 'errors')}">
                                	<select id="peripheralPeople" name="peripheralPeople" multiple="multiple" size="20" style="width:280px">
                                		<g:each in="${com.jdonee.Department.findAllByClosed(Boolean.FALSE)}" status="i" var="departmentInstance">
                                			<optgroup label="${fieldValue(bean: departmentInstance, field: "name")}[${fieldValue(bean: departmentInstance, field: "company.name")}]">
                                				<g:each in="${com.jdonee.Job.findAllByDepartmentAndClosed(departmentInstance,Boolean.FALSE)}" status="j" var="jobInstance">
                                					<option value="${fieldValue(bean: jobInstance, field: "code")}">${jobInstance}</option>
                                				</g:each>
                                			</optgroup>
                                		</g:each>
                                	</select>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">&nbsp;</td>
                                <td valign="top" class="value">
                                    &nbsp;
                                </td>
                                <td>&nbsp;</td>
                            </tr>
							<tr class="prop">
                                <td valign="top" class="name">&nbsp;</td>
                                <td valign="top" class="value">
                                    &nbsp;
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">&nbsp;</td>
                                <td valign="top" class="value">
                                    &nbsp;
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">&nbsp;</td>
                                <td valign="top" class="value">
                                    &nbsp;
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">&nbsp;</td>
                                <td valign="top" class="value">
                                    &nbsp;
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">&nbsp;</td>
                                <td valign="top" class="value">
                                    &nbsp;
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
</div>