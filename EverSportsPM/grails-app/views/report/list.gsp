
<%@ page import="com.jdonee.PersonalPerformance" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personalPerformance.label', default: 'PersonalPerformance')}" />
        <export:resource />
        <filterpane:includes />
        <title><g:message code="personPerformanceReport.list.label" default="Person Performance Report" /></title>
        <jq:jquery>
        	$("#reportList").css({"color":"#ff6600","font-weight":"bold","text-decoration":"none"});
		</jq:jquery>
    </head>
    <h3 class="ui-widget-header"><g:message code="personPerformanceReport.list.label" default="Person Performance Report" /></h3>
    	<div id="pageBody">
        <br/>
        <div class="body">
        	<div id="options">
                <g:form method="post" action="setSearchParamsMax" style="height:40px;">
                    <g:hiddenField name="params" value="${filterParams}" />
                    <div class="dialog">
                        <table>
                            <tbody>
                                <tr class="prop">
                                    <td valign="top" class="name">
                                        <label for="max"><g:message code="default.perpage.label" default="Results per page" />:</label>
                                        <input type="text" maxlength="4" id="newMax" name="newMax" value="${params.max}"/>
                                    </td>
                                    <td valign="top" class="value">
                                        <span class="buttons">
                                            <g:actionSubmit action="setSearchParamsMax" class="go" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                        </span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </g:form>
                <div class="paginateButtons">
                <g:message code="default.results.label" default="Results" />: ${personalPerformanceInstanceList.size()} / ${personalPerformanceInstanceTotal}
                <span class="searchButtons">
                    <filterpane:filterButton text="${message(code: 'default.filter.label', default: 'Filter')}" /> 
                </span>
            </div>
            </div>
            <br/>
            <filterpane:filterPane action="list" class="query_dialog" style="width:600px;"  domain="com.jdonee.PersonalPerformance" 
            associatedProperties="performance.name,job.company.name,job.department.name,job.user.employeeName"
            excludeProperties="feedbackPeople,jobRuleScore,kpiRuleScore,feedbackPeople,peripheralPeople,feedback"
        	filterPropertyValues="${['dateCreated':[years:2001..2050,precision:'day'],'status':[displayProperty:'label']]}" dialog="true" visible="n" showSortPanel="n" showTitle="n" fullAssociationPathFieldNames="false"/>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        	<g:sortableColumn property="performance" title="${message(code: 'personalPerformance.performance.label', default: 'Performance')}" params="${filterParams}"/>
                        
                            <g:sortableColumn property="job.company.name" title="${message(code: 'job.company.label', default: 'Company')}" params="${filterParams}"/>
                            
                            <g:sortableColumn property="job.department.name" title="${message(code: 'job.department.label', default: 'Department')}" params="${filterParams}"/>
                            
                            <g:sortableColumn property="job.user.employeeName" title="${message(code: 'user.employeeName.label', default: 'Employee Name')}" params="${filterParams}"/>
                        
                            <g:sortableColumn property="job.name" title="${message(code: 'job.name.label', default: 'Name')}" params="${filterParams}"/>
                        
                            <g:sortableColumn property="job.code" title="${message(code: 'job.code.label', default: 'Code')}" params="${filterParams}"/>
                            
                            <g:sortableColumn property="job.parentCode" title="${message(code: 'job.parentCode.label', default: 'Parent Code')}" params="${filterParams}"/>   
                            
                            <g:sortableColumn property="job.jobType.name" title="${message(code: 'job.jobType.label', default: 'Job Type')}" params="${filterParams}"/>   
                            
                            <g:sortableColumn property="mainLevel" title="${message(code: 'personalPerformance.mainLevel.label', default: 'Main Level')}" params="${filterParams}"/>
                        
                            <g:sortableColumn property="companyRuleLevel" title="${message(code: 'personalPerformance.companyRuleLevel.label', default: 'Company Rule Level')}" params="${filterParams}"/>
                        
                            <g:sortableColumn property="kpiRuleScore" title="${message(code: 'personalPerformance.kpiRuleScore.label', default: 'Kpi Rule Score')}" params="${filterParams}"/>
                            
                            <g:sortableColumn property="jobRuleScore" title="${message(code: 'personalPerformance.jobRuleScore.label', default: 'Job Rule Score')}" params="${filterParams}"/>
         
                            <g:sortableColumn property="score" title="${message(code: 'personalPerformance.score.label', default: 'Score')}" params="${filterParams}"/>
                            
                            <g:sortableColumn property="feedbackPeople" title="${message(code: 'personalPerformance.feedbackPeople.label', default: 'Feedback People')}" params="${filterParams}"/>
                            
                            <g:sortableColumn property="status" title="${message(code: 'personalPerformance.status.label', default: 'Status')}" params="${filterParams}"/>
                            
                            <g:sortableColumn property="dateCreated" title="${message(code: 'personalPerformance.dateCreated.label', default: 'Date Created')}" params="${filterParams}"/>
                            
                            <th class="sortable" style="font-size:10px;">${message(code: 'default.operater.label', default: 'Operater')}</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${personalPerformanceInstanceList}" status="i" var="personalPerformanceInstance">
                        <tr class="${(i % 2) == 0 ? 'clickableOdd' : 'clickableEven'}">                  
                            <td>${fieldValue(bean: personalPerformanceInstance, field: "performance")}</td>
                            
                            <td>${personalPerformanceInstance?.job?.company?.name?.encodeAsHTML()}</td>
                            
                            <td>${personalPerformanceInstance?.job?.department?.name?.encodeAsHTML()}</td>
                            
                            <td>${personalPerformanceInstance?.job?.user?.employeeName?.encodeAsHTML()}</td>
                            
                            <td>${personalPerformanceInstance?.job?.name?.encodeAsHTML()}</td>
                            
                            <td>${personalPerformanceInstance?.job?.code?.encodeAsHTML()}</td>
                            
                            <td>${personalPerformanceInstance?.job?.parentCode?.encodeAsHTML()}</td>
                            
                             <td>${personalPerformanceInstance?.job?.jobType?.name?.encodeAsHTML()}</td>
                        
                            <td>${fieldValue(bean: personalPerformanceInstance, field: "mainLevel")}</td>
                        
                            <td>${fieldValue(bean: personalPerformanceInstance, field: "companyRuleLevel")}</td>
                            
                            <td>${fieldValue(bean: personalPerformanceInstance, field: "kpiRuleScore")}</td>
                        
                            <td>${fieldValue(bean: personalPerformanceInstance, field: "jobRuleScore")}</td>
                        
                            <td>${fieldValue(bean: personalPerformanceInstance, field: "score")}</td>
                        
                            <td>${fieldValue(bean: personalPerformanceInstance, field: "feedbackPeople")}</td>
                        
                            <td>${personalPerformanceInstance?.status?.label?.encodeAsHTML()}</td>
                            
                            <td><g:formatDate date="${personalPerformanceInstance.dateCreated}"/></td>
                            
                            <td class="notClickable">
                                    <g:link action="show" id="${personalPerformanceInstance.id}">
                                        <img  src="${resource(dir:'images/skin',file:'database_go.png')}" alt="${message(code: 'default.button.show.label', default: 'Show')}" />
                                    </g:link>
                            </td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
             <div class="paginateButtons">
                <g:paginate total="${personalPerformanceInstanceTotal}" params="${filterParams}" />
            </div>
            <export:formats  params="${filterParams}" formats="['csv', 'excel', 'rtf']"/>
        </div>
        </div>
    </body>
</html>
