<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
		<link rel="stylesheet" href="${resource(dir:'js/jquery-ui-layout/css',file:'layout-default-latest.css')}"/>
		<!--[if lte IE 7]>
		<style type="text/css"> body { font-size: 85%; } </style>
		<![endif]-->
        <style type="text/css">
        .icon_warn {
		   background: transparent url('${fam.icon(name: 'bullet_red')}') 0px 50% no-repeat;
    	   padding-left: 15px;
    	   font-size: 12px;
		}
        </style>
        <g:javascript library="jquery" plugin="jquery"/>
        <!--<g:javascript src="themeroller/themeswitchertool.js"/>
        <jqui:resources theme="cupertino"/>-->
        <jqui:resources/> 
        <g:javascript src="jquery-ui-layout/jquery.layout-latest.js"/>
        <g:layoutHead />
        <jq:jquery>
        	jQuery.fn.outerHtml = function(include_scripts) {
				if(include_scripts === undefined){ include_scripts = false; }
				var clone = this.clone(true);
				var items = jQuery.map(clone, function(element){
				if(jQuery.nodeName(element, "script")){
				if(include_scripts){
				var attributes;
				if(element.attributes){
				attributes = jQuery.map(element.attributes, function(attribute){
				return attribute.name + '="' + attribute.value + '" ';
				});
				}
				return '<' + element.nodeName + ' ' + attributes.join(' ') + ">" + jQuery(element).html() + "</" + element.nodeName +'>';
				} else {
				return '';
				}
				} else {
				return jQuery('<div>').append(element).remove().html();
				}
				});
				return items.join('');
			}     	
        	$('body').layout({
        	north__spacing_open: 0, 
        	south__spacing_open: 0
        	});
        	$("h3+ul").filter(function(index){
        		return $.isEmptyObject($(this).find('li').outerHtml());
        	}).prev().remove();
        	$("ul").filter(function(index){
        		return $.isEmptyObject($(this).find('li').outerHtml());
        	}).remove();
        	$("#accordion").accordion({
				header:'h3',
				autoHeight:false,
				navigation:true,
				icons:{
						header:'ui-icon-plus',
						headerSelected:'ui-icon-minus'
					  }
			});
        	//addThemeSwitcher( 'body > .ui-layout-north', { top: '20px', right: '20px' });
        </jq:jquery>
        <g:javascript>
        /**
         *	addThemeSwitcher
         *	Remove the cookie set by the UI Themeswitcher to reset a page to default styles
         *	Dependancies: js/themeroller/themeswitchertool.js
         */
        function addThemeSwitcher ( container, position ) {
        	var pos = { top: '10px', right: '10px', zIndex: 10 };
        	$('<div id="themeContainer" style="position: absolute; overflow-x: hidden;">${message(code: 'jquery.theme.selectalert.label', default: 'Please select a theme:')}</div>')
        		.css( $.extend( pos, position ) )
        		.appendTo( container || 'body')
        		.themeswitcher()
        	;
        };
        </g:javascript>
    </head>
    <body >
    	<div class="ui-layout-north hidden">
	        <div id="spinner" class="spinner" style="display:none;">
	            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
	        </div>
	         <div id="grailsLogo"><a href="${createLink(uri: '/')}"><img src="${resource(dir:'images',file:'everSport-logo.jpg')}" alt="上海艾动实业有限公司" border="0" /></a></div>
        	 <sec:ifLoggedIn>
        	 	<div>
        	 		<span style="float:left;color:#48802c;"><sec:username/>.${message(code: 'main.title.label',default:'Welcome to Ever Sports System')}.</span>
        	 		<span style="float:right;margin-right:5px;font-size:15px;"><g:link controller="logout" style="color:#48802c;">${message(code: 'main.logout.label',default:'Log Out')}</g:link></span>
        	 	</div>
        	 </sec:ifLoggedIn>
        </div>
        <div class="ui-layout-south hidden">
        	<g:render template="/layouts/footer"/>
        </div>
        <div class="ui-layout-west hidden">
        	<h3 class="ui-widget-header">${message(code: 'menu.label', default: 'My Menu')}</h3>
	     	<div id="accordion">
					<h3><a href="javascript:void(0);">${message(code: 'menu.system.label', default: 'System Management')}</a></h3>
					<ul><sec:access url="/company/**">
                        <li><g:link elementId="companyList" controller="company">${message(code: 'menu.company.label', default: 'Company Management')}</g:link></li>
                        </sec:access>
                        <sec:access url="/department/**">
                        <li><g:link elementId="departmentList" controller="department">${message(code: 'menu.department.label', default: 'Department Management')}</g:link></li>
                        </sec:access>
                        <sec:access url="/user/**">
                        <li><g:link elementId="userList" controller="user">${message(code: 'menu.user.label', default: 'User Management')}</g:link></li>
                        </sec:access>
                        <sec:access url="/role/**">
                        <li><g:link elementId="roleList" controller="role">${message(code: 'menu.role.label', default: 'Role Management')}</g:link></li>
                        </sec:access>
                        <sec:access url="/requestmap/**">
                        <li><g:link elementId="requestmapList" controller="requestmap">${message(code: 'menu.requestmap.label', default: 'Requestmap Management')}</g:link></li>
                        </sec:access>

                        </ul>
					<h3><a href="javascript:void(0);">${message(code: 'menu.performance.label', default: 'Performance Management')}</a></h3>
					<ul>
						<sec:access url="/job/**">
						<li><g:link elementId="jobList" controller="job">${message(code: 'menu.job.label', default: 'Job Management')}</g:link></li>
						</sec:access>
						<sec:access url="/performance/**">
                       	<li><g:link elementId="performanceList" controller="performance">${message(code: 'menu.newPerformance.label', default: 'New Performance Management')}</g:link></li>
                        </sec:access>
                        <sec:access url="/report/**">
                        <li><g:link elementId="reportList" controller="report">${message(code: 'menu.report.label', default: 'Report Management')}</g:link></li>
                        </sec:access>
                        <sec:access url="/systemTemplate/**">
                        <li><g:link elementId="systemTemplateList" controller="systemTemplate">${message(code: 'menu.systemTemplate.label', default: 'System Template Management')}</g:link></li>
                        </sec:access>
                        <sec:access url="/scoreLevel/**">
                        <li><g:link elementId="scoreLevelList" controller="scoreLevel">${message(code: 'menu.scoreLevel.label', default: 'Score Level Management')}</g:link></li>
                    	</sec:access>
                    </ul>
					<h3><a href="javascript:void(0);">${message(code: 'menu.person.label', default: 'Person Management')}</a></h3>
					<ul>
						<sec:access url="/personInfo/**">
                    	<li><g:link elementId="personInfoList" controller="personInfo">${message(code: 'menu.personInfo.label', default: 'Person Info')}</g:link></li>
                        </sec:access>
                        <sec:access url="/personalPerformance/**">
                        <li><g:link elementId="personalPerformanceList" controller="personalPerformance">${message(code: 'menu.personPerformance.label', default: 'Person Performance')}</g:link></li>
                        </sec:access>
                        <sec:access url="/myPersonalPerformance/**">
                        <li><g:link elementId="myPersonPerformanceList" controller="myPersonPerformance">${message(code: 'menu.myPersonPerformance.label', default: 'My Person Performance')}</g:link></li>
                        </sec:access>
                        <sec:access url="/peripheralPersonPerformance/**">
                        <li><g:link elementId="peripheralPersonPerformanceList" controller="peripheralPersonPerformance">${message(code: 'menu.peripheralPersonPerformance.label', default: 'Peripheral Person Performance')}</g:link></li>
                        </sec:access>
                        <sec:access url="/superiorPersonPerformance/**">
                        <g:if test="${session.checkMenuPermission}">
                        <li><g:link elementId="superiorPersonPerformanceList" controller="superiorPersonPerformance">${message(code: 'menu.superiorPersonPerformance.label', default: 'Superior Person Performance')}</g:link></li>
                        </g:if>
                        </sec:access>
                    </ul> 
			</div>
        </div>
        <div class="ui-layout-center hidden">
        	<sec:ifNotLoggedIn>
	          	<g:render template="/login/sidebar_login"/>
                <jq:jquery>
                	$("#login").dialog({
                	   modal:true,
                	   height:200,
                	   width:320,
                	   resizable:false,
					   closeOnEscape: false,
					   open: function(event, ui) { $(".ui-dialog-titlebar-close").hide(); }
					});
                </jq:jquery>
	        </sec:ifNotLoggedIn>
        	<g:layoutBody />
        </div>
        </body>
</html>