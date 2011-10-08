
<%@ page import="com.jdonee.UserRole"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'userRole.label', default: 'UserRole')}" />
<title><g:message code="default.list.label" args="[entityName]" />
</title>
</head>
<body>
	<div title="<g:message code="default.list.label" args="[entityName]" />" iconCls="icon-reload" closable="true">
        <div class="nav">
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
    <br/>
	<div class="body">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<div class="list">
			<table>
				<thead>
					<tr>

						<th><g:message code="userRole.role.label" default="角色" />
						</th>

						<th><g:message code="userRole.user.label" default="用户" />
						</th>

						<th>操作</th>

					</tr>
				</thead>
				<tbody>
					<g:each in="${userRoleInstanceList}" status="i"
						var="userRoleInstance">
						<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

							<td>
								${fieldValue(bean: userRoleInstance, field: "role")}
							</td>

							<td>
								${fieldValue(bean: userRoleInstance, field: "user")}
							</td>

							<td>
								<div class="buttons">
									<g:form>
										<g:hiddenField name="role.id" value="${userRoleInstance?.role.id}" />
										<g:hiddenField name="user.id" value="${userRoleInstance?.user.id}" />
										<span class="button"><g:actionSubmit class="delete"
												action="delete"
												value="${message(code: 'default.button.delete.label', default: '删除')}"
												onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: '你确定要删除吗?')}');" />
										</span>
									</g:form>
								</div></td>

						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
		<div class="paginateButtons">
			<g:paginate total="${userRoleInstanceTotal}" />
		</div>
	</div>
	</div>
</body>
</html>
