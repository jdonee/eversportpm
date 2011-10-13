<html>
    <head>
        <title>${message(code: 'main.title.label', default: 'Welcome to Ever Sports System')}</title>
        <meta name="layout" content="main" />
        <style type="text/css" media="screen">
        h2 {
            margin-top:15px;
            margin-bottom:15px;
            font-size:1.2em;
        }
        </style>
    </head>
    <body>
    	<h3 class="ui-widget-header">${message(code: 'default.home.label', default: 'Home')}</h3>
        <div id="pageBody">
            <h1>系统使用说明</h1>
            <p>公司管理：管理公司名称、编号、是否关闭、描述等信息。</p>
			<p>部门管理：管理部门名称、编号、是否关闭、描述等信息。</p>
			<p>用户管理:  管理用户名称、登录名、密码、是否关闭等信息。</p>
			<p>角色管理：管理用户角色以及模块使用权限。</p>
			<p>岗位管理：管理用户的岗位，一个用户可多个岗位。</p>
			<p>考核管理：这部分是本系统的核心，主要包含如下几个部分。<br/>
			               1)开启考核，生成新的考核周期。考核周期主要包含如下几个部分：开启考核、员工指定指标、上级审核、员工自评、周边评价、领导评分、员工确认、领导确认、关闭考核。<br/>
			               2)关闭某考核周期，一旦关闭无法重新开启。<br/>
			               3)查询考核结果，按公司或部门生成考核报表，当点击岗位时，可查看该岗位当前的详细考核记录。 <br/>
			               4)创建考核模板。<br/>
			               5)创建考核计算规则。<br/>
			<p>个人管理：这部分也是本系统的核心，主要包含如下几个部分。<br/>
			               1)个人首页，显示用户的个人信息、岗位信息、所在部门，所在公司等。<br/>
			               2)个人考核，首先选择岗位，联动菜单弹出考核周期，这里有两种状态：<br/>
			                    1、新建：新建考核指标，按照要求输入考核的指标。<br/>
			                    2、查询：可查询当前个人考核表中的每个岗位的考核状态，并导出至Excel报表。<br/>
			                    3、考核：<br/>
					                                   一、当员工输入完成自己的完成指标，点击完成。<br/>
					                                   二、当员工处于确认阶段，查看考核明细，点击确认或者反确认进入其他阶段。<br/>
					                3)周边考核，首先联动选择公司、部门、岗位、考核周期，输入您对该岗位的评价，点击确认，此操作必须在领导完成评分之前完成。<br/>
					                4)下级考核：[这一块只有公司负责人或者有下属的上级才能参与下级考核]<br/>
					                                    首先联动选择公司、部门、岗位、考核周期、输入您对该岗位的评价，点击评价或者确认。<br/>
            </p>
            <%--<div id="controllerList" class="dialog">
                <h2>Available Controllers:</h2>
                <ul>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                    </g:each>
                </ul>
        </div>--%>
        </div>
    </body>
</html>
