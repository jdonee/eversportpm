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
        #pageBody {
            margin-left:20px;
            margin-right:20px;
        }
        </style>
    </head>
    <body>
        <div id="pageBody" title="${message(code: 'default.home.label', default: 'Home')}" style="padding:20px;overflow:auto;">
            <h1>Welcome to Grails</h1>
            <p>Congratulations, you have successfully started your first Grails application! At the moment
            this is the default page, feel free to modify it to either redirect to a controller or display whatever
            content you may choose. Below is a list of controllers that are currently deployed in this application,
            click on each to execute its default action:</p>
            <%----%><div id="controllerList" class="dialog">
                <h2>Available Controllers:</h2>
                <ul>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                    </g:each>
                </ul>
        </div>
    </body>
</html>
