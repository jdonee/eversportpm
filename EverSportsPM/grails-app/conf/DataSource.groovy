dataSource {
	pooled = true
	//driverClassName = "org.hsqldb.jdbcDriver"
	//username = "sa"
	//password = ""
	driverClassName = "com.mysql.jdbc.Driver"
	dialect = org.hibernate.dialect.MySQL5InnoDBDialect
	username = "grails"
	password = "server"
	properties {
		maxActive = 50
		maxIdle = 25
		minIdle = 5
		initialSize = 5
		minEvictableIdleTimeMillis = 60000
		timeBetweenEvictionRunsMillis = 60000
		maxWait = 10000
		validationQuery = "/* ping */"
		}
}
hibernate {
	cache.use_second_level_cache=true
	cache.use_query_cache=true
	cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "create-drop" // one of 'create', 'create-drop','update'
			//url = "jdbc:hsqldb:mem:devDB"
			url = "jdbc:mysql://localhost:3306/eversportspm_dev?autoreconnect=true&useUnicode=true&characterEncoding=utf-8"
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			//url = "jdbc:hsqldb:mem:testDb"
			url = "jdbc:mysql://localhost:3306/eversportspm_test?autoreconnect=true&useUnicode=true&characterEncoding=utf-8"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			//url = "jdbc:hsqldb:file:prodDb;shutdown=true"
			url = "jdbc:mysql://localhost:3306/eversportspm?autoreconnect=true&useUnicode=true&characterEncoding=utf-8"
		}
	}
}