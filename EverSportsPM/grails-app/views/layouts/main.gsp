<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <style type="text/css">
        .icon_warn {
		   background: transparent url('${fam.icon(name: 'bullet_red')}') 0px 50% no-repeat;
    	   padding-left: 15px;
    	   font-size: 12px;
		}
		.query_dialog table{
			padding: 5px 0;
		}
		
		.query_dialog table td{
			white-space: nowrap;
		}
		
		.menunav {
			background:#efefef;
		}
		.menunav ul {
			color: #48802c;
            list-style-type:none;
            padding:10px;
            margin-top:10px;
            margin-bottom:10px;
            /*letter-spacing:2px;*/
            overflow:auto;
        }
        .menunav ul li{
			background: transparent url('${fam.icon(name: 'lightning_go')}') 0px 50% no-repeat;
    	    padding-left: 20px;
    	    padding-top: 5px;
    	    font-size: 12px;
        }
         a{font-size:12px; color:#006699; line-height:160%; text-decoration:none }
		 a:link{font-size:12px; color:#006699; line-height:160%; text-decoration:none }
		 a:active{font-size:12px;color:#990000; line-height:160%;}
		 a:hover{font-size:12px; color:#3366ff; line-height:160%; text-decoration:none}
        </style>
        <g:javascript library="jquery" plugin="jquery"/>
        <jqui:resources theme="ui-lightness" />
        <jqueryui:javascript/>
        <link rel="stylesheet" href="${resource(dir:'js/jquery-easyui-1.2.4/themes/default',file:'easyui.css')}"/>
		<link rel="stylesheet" href="${resource(dir:'js/jquery-easyui-1.2.4/themes',file:'icon.css')}"/>
        <g:javascript src="jquery-easyui-1.2.4/jquery.easyui.min.js"/>
        <g:layoutHead />
    </head>
    <body class="easyui-layout">
    	<div region="north" border="false" >
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
         <div id="grailsLogo"><a href="${createLink(uri: '/')}"><img src="${resource(dir:'images',file:'everSport-logo.jpg')}" alt="上海艾动实业有限公司" border="0" /></a></div>
        </div>
        <div region="south" border="false" style="height:25px;padding:1px;background:#efefef;">
        	<g:render template="/layouts/footer"/>
        </div>
        <div region="west" split="true" title="${message(code: 'menu.label', default: 'My Menu')}" style="width:200px;padding1:1px;overflow:hidden;">
	     	<div class="easyui-accordion" fit="true" border="true">
					<div title="${message(code: 'menu.system.label', default: 'System Management')}" class="menunav">
					<ul>
                        <li><g:link controller="company">${message(code: 'menu.company.label', default: 'Company Management')}</g:link></li>
                        <li><g:link controller="department">${message(code: 'menu.department.label', default: 'Department Management')}</g:link></li>
                        <li><g:link controller="role">${message(code: 'menu.role.label', default: 'Role Management')}</g:link></li>
                        <li><g:link controller="user">${message(code: 'menu.user.label', default: 'User Management')}</g:link></li>
                        <li><g:link controller="job">${message(code: 'menu.job.label', default: 'Job Management')}</g:link></li>
                    </ul>
					</div>
					<div title="${message(code: 'menu.performance.label', default: 'Performance Management')}"  class="menunav">
					<ul>
                       	<li><g:link controller="performance">${message(code: 'menu.newPerformance.label', default: 'New Performance Management')}</g:link></li>
                        <li><g:link controller="report">${message(code: 'menu.report.label', default: 'Report Management')}</g:link></li>
                        <li><g:link controller="systemTemplate">${message(code: 'menu.systemTemplate.label', default: 'System Template Management')}</g:link></li>
                        <li><g:link controller="scoreLevel">${message(code: 'menu.scoreLevel.label', default: 'Score Level Management')}</g:link></li>
                    </ul>
					</div>
					<div title="${message(code: 'menu.person.label', default: 'Person Management')}" class="menunav" selected="true">
					<ul>
                    	<li selected="true"><g:link controller="/">${message(code: 'menu.personInfo.label', default: 'Person Info')}</g:link></li>
                        <li><g:link controller="/">${message(code: 'menu.personPerformance.label', default: 'Person Performance')}</g:link></li>
                        <li><g:link controller="/">${message(code: 'menu.queryPersonPerformance.label', default: 'Query Person Performance')}</g:link></li>
                        <li><g:link controller="/">${message(code: 'menu.peripheralPersonPerformance.label', default: 'Peripheral Person Performance')}</g:link></li>
                        <li><g:link controller="/">${message(code: 'menu.superiorPersonPerformance.label', default: 'Superior Person Performance')}</g:link></li>
                    </ul> 
					</div>
				</div>
        </div>
        <div region="center" style="overflow:hidden;" split="true">
	        <div class="easyui-tabs" fit="true" border="false">
	        <g:layoutBody />
	        </div>
        </div>
        </body>
</html>