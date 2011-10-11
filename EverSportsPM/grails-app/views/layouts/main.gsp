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
<<<<<<< HEAD
        </style>
        <g:javascript library="jquery" plugin="jquery"/>
        <!--<g:javascript src="themeroller/themeswitchertool.js"/>
        <jqui:resources theme="cupertino"/>-->
        <jqui:resources/> 
=======
		
		div#accordion h3 a{
			font-size:15px;
		}
		
		div#accordion ul {
			color: #48802c;
            padding-top:10px;
            padding-left: 15px;
            margin-bottom:10px;
            overflow:auto;
        }
        div#accordion ul li{
			background: transparent url('${fam.icon(name: 'lightning_go')}') 0px 50% no-repeat;
    	    padding-left: 20px;
    	    padding-top: 5px;
    	    list-style-type:none;
        }
        </style>
        <g:javascript library="jquery" plugin="jquery"/>
        <!--<g:javascript src="themeroller/themeswitchertool.js"/>--> 
        <jqui:resources/>
>>>>>>> a427aa0a14c763cc13aba14d570612cabc01da30
        <jqueryui:javascript/>
        <g:javascript src="jquery-ui-layout/jquery.layout-latest.js"/>
        <g:layoutHead />
        <jq:jquery>     	
        	$('body').layout({
        	north__spacing_open: 0, 
        	south__spacing_open: 0
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
<<<<<<< HEAD
        	 <sec:ifLoggedIn>
        	 	<div>
        	 		<span style="float:left;color:#48802c;"><sec:username/>.${message(code: 'main.title.label')}.</span>
        	 		<span style="float:right;margin-right:5px;font-size:15px;"><g:link controller="logout" style="color:#48802c;">${message(code: 'main.logout.label')}</g:link></span>
        	 	</div>
        	 </sec:ifLoggedIn>
=======
        	  	
>>>>>>> a427aa0a14c763cc13aba14d570612cabc01da30
        </div>
        <div class="ui-layout-south hidden">
        	<g:render template="/layouts/footer"/>
        </div>
        <div class="ui-layout-west hidden">
        	<h3 class="ui-widget-header">${message(code: 'menu.label', default: 'My Menu')}</h3>
	     	<div id="accordion">
					<h3><a href="javascript:void(0);">${message(code: 'menu.system.label', default: 'System Management')}</a></h3>
					<ul>
                        <li><g:link controller="company">${message(code: 'menu.company.label', default: 'Company Management')}</g:link></li>
                        <li><g:link controller="department">${message(code: 'menu.department.label', default: 'Department Management')}</g:link></li>
                        <li><g:link controller="role">${message(code: 'menu.role.label', default: 'Role Management')}</g:link></li>
                        <li><g:link controller="user">${message(code: 'menu.user.label', default: 'User Management')}</g:link></li>
                        <li><g:link controller="job">${message(code: 'menu.job.label', default: 'Job Management')}</g:link></li>
                    </ul>
					<h3><a href="javascript:void(0);">${message(code: 'menu.performance.label', default: 'Performance Management')}</a></h3>
					<ul>
                       	<li><g:link controller="performance">${message(code: 'menu.newPerformance.label', default: 'New Performance Management')}</g:link></li>
                        <li><g:link controller="report">${message(code: 'menu.report.label', default: 'Report Management')}</g:link></li>
                        <li><g:link controller="systemTemplate">${message(code: 'menu.systemTemplate.label', default: 'System Template Management')}</g:link></li>
                        <li><g:link controller="scoreLevel">${message(code: 'menu.scoreLevel.label', default: 'Score Level Management')}</g:link></li>
                    </ul>
					<h3><a href="javascript:void(0);">${message(code: 'menu.person.label', default: 'Person Management')}</a></h3>
					<ul>
<<<<<<< HEAD
                    	<li><g:link controller="personInfo">${message(code: 'menu.personInfo.label', default: 'Person Info')}</g:link></li>
=======
                    	<li><g:link controller="/">${message(code: 'menu.personInfo.label', default: 'Person Info')}</g:link></li>
>>>>>>> a427aa0a14c763cc13aba14d570612cabc01da30
                        <li><g:link controller="/">${message(code: 'menu.personPerformance.label', default: 'Person Performance')}</g:link></li>
                        <li><g:link controller="/">${message(code: 'menu.queryPersonPerformance.label', default: 'Query Person Performance')}</g:link></li>
                        <li><g:link controller="/">${message(code: 'menu.peripheralPersonPerformance.label', default: 'Peripheral Person Performance')}</g:link></li>
                        <li><g:link controller="/">${message(code: 'menu.superiorPersonPerformance.label', default: 'Superior Person Performance')}</g:link></li>
                    </ul> 
			</div>
			<jqueryui:jquiAccordion
                        id="accordion"
                        namespace="grails.jqueryui.components"
                        renderMarkup="false"
                        config="${[header:'h3',autoHeight:'false',navigation:'true',icons:[header:'ui-icon-plus',headerSelected:'ui-icon-minus']]}"/> 
        </div>
        <div class="ui-layout-center hidden">
<<<<<<< HEAD
=======
	        <div class="easyui-tabs" fit="true" border="false">
>>>>>>> a427aa0a14c763cc13aba14d570612cabc01da30
	        <g:layoutBody />
        </div>
        </body>
</html>