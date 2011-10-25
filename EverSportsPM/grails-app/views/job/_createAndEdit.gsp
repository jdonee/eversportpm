<link rel="stylesheet" href="${resource(dir:'js/select-autocomplete',file:'autocomplete.css')}"/>
<g:javascript src="select-autocomplete/jquery.autocomplete.js"/>
<g:javascript src="select-autocomplete/jquery.select-autocomplete.js"/>
<jq:jquery>
	$("#jobList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
	getDepartments($("select[id^='company']").val());
	$('select.autocomplete').select_autocomplete({width:'145px'});
    $('select.autocomplete').show();
    $('#parentCode').autocomplete(  
         "${createLink(controller:'job', action: 'autocompleteSearchCode')}"  
         , {    
             multiple: false,  
             autoFill:true,  
             width:150,      
             max:10,  
             multipleSeparator: ' ',     
             dataType: 'json',      
             parse: function(data) {    
                 var rows = [];  
                 for(var i=0;i < data.length; i++){  
                     rows[rows.length] = {     
                         data:data[i],//drop down list value  
                         value:data[i][0],
                         result:data[i][0]+'('+data[i][1]+')'  
                     };     
                 }    
                 return rows;    
             },    
             formatItem: function(row, i, n) {  
                 return row[0]+'-'+row[1];          
             }    
         }  
     ).result(function(event, data, formatted) { 
     	 $(this).val(!data?null:data[0]);
     }); 
	$("select[id^='company']").change(function() {
		getDepartments($(this).val());
		});
	function getDepartments(companyId){
		$.getJSON("${createLink(controller:'job',action:'getDepartments')}", 
		 			{companyId:companyId}, // 参数 
		 			function(data){
		 				$("select[id^='department']").empty();
						for(i=0;i < data.length ;i++){ 
							document.getElementById("department.id").options.add(new Option(data[i][2]+"("+data[i][1]+")",data[i][0]));
						} 
					});
		}
</jq:jquery>
<div class="dialog">
                    <table>
                        <tbody>
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="company"><g:message code="job.company.label" default="Company" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobInstance, field: 'company', 'errors')}">
                                	<select id="company.id" name="company.id"> 
	                                	 <g:each in="${com.jdonee.Company.findAllByClosed(Boolean.FALSE)}" status="i" var="company">
	                                	 	<option value="${company.id}">${company.name}[${company.code}]</option>  
			                            </g:each>
		                            </select>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="department"><g:message code="job.department.label" default="Department" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobInstance, field: 'department', 'errors')}">
                                	<select id="department.id" name="department.id">
                                		 <option value=""><g:message code="default.select.option" default="--please select--"/></option>  
		                            </select>
                                </td>
                                <td>&nbsp;
                                <g:if test="${hasErrors(bean: jobInstance, field: 'department', 'errors')}">
									<jqvalui:renderError for="department" style="margin-top: -5px">
										<g:eachError bean="${jobInstance}" field="department">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user"><g:message code="job.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobInstance, field: 'user', 'errors')}">
                                    <g:select class="autocomplete" name="user.id"  from="${com.jdonee.User.findAllByEnabled(Boolean.TRUE)}" optionKey="id" value="${jobInstance?.user?.id}"  />
                                </td>
                                <td>&nbsp;
                                <g:if test="${hasErrors(bean: jobInstance, field: 'user', 'errors')}">
									<jqvalui:renderError for="user" style="margin-top: -5px">
										<g:eachError bean="${jobInstance}" field="user">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="job.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="50" value="${jobInstance?.name}" />
                                </td>
                                 <td>&nbsp;
								<g:if test="${hasErrors(bean: jobInstance, field: 'name', 'errors')}">
									<jqvalui:renderError for="name" style="margin-top: -5px">
										<g:eachError bean="${jobInstance}" field="name">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="code"><g:message code="job.code.label" default="Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobInstance, field: 'code', 'errors')}">
                                    <g:textField name="code" maxlength="50" value="${jobInstance?.code}" />
                                    <span class="icon_warn"><g:message code="job.code.warn" default="code must be is a integer,for example '010101'" /></span>
                                </td>
                                <td>&nbsp;
								<g:if test="${hasErrors(bean: jobInstance, field: 'code', 'errors')}">
									<jqvalui:renderError for="code" style="margin-top: -5px">
										<g:eachError bean="${jobInstance}" field="code">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="parentCode"><g:message code="job.parentCode.label" default="Parent Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobInstance, field: 'parentCode', 'errors')}">
                                    <g:textField name="parentCode" maxlength="50" value="${jobInstance?.parentCode}" />
                                    <span class="icon_warn"><g:message code="job.parentCode.warn" default="parentCode must be is a integer,for example '010101'" /></span>
                                </td>
                                 <td>&nbsp;
								<g:if test="${hasErrors(bean: jobInstance, field: 'parentCode', 'errors')}">
									<jqvalui:renderError for="parentCode" style="margin-top: -5px">
										<g:eachError bean="${jobInstance}" field="parentCode">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="jobType"><g:message code="job.jobType.label" default="JobType" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobInstance, field: 'jobType', 'errors')}">
                                    <g:select name="jobType.id" from="${com.jdonee.JobType.list()}" optionKey="id" value="${jobInstance?.jobType?.id}"  />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="job.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" value="${jobInstance?.description}" maxlength="150" class="text" style="width: 500px; height: 200px;"/>
                                </td>
                                <td>&nbsp;
								<g:if test="${hasErrors(bean: jobInstance, field: 'description', 'errors')}">
									<jqvalui:renderError for="description" style="margin-top: -5px">
										<g:eachError bean="${jobInstance}" field="description">
											<g:message error="${it}" />
										</g:eachError>
									</jqvalui:renderError>
								</g:if>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="companyResponsible"><g:message code="job.companyResponsible.label" default="Company Responsible" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobInstance, field: 'companyResponsible', 'errors')}">
                                    <g:checkBox name="companyResponsible" value="${jobInstance?.companyResponsible}" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="closed"><g:message code="job.closed.label" default="Closed" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jobInstance, field: 'closed', 'errors')}">
                                    <g:checkBox name="closed" value="${jobInstance?.closed}" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>		
		</tbody>
	</table>
</div>