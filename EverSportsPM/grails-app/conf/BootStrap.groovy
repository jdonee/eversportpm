import grails.util.GrailsUtil

import com.jdonee.Role
import com.jdonee.User
import com.jdonee.UserRole
import com.jdonee.Company
import com.jdonee.Department
import com.jdonee.JobType
import com.jdonee.Job
import com.jdonee.Performance
import com.jdonee.PersonalPerformance
import com.jdonee.SystemTemplate
import com.jdonee.utils.TemplateType
import com.jdonee.ScoreLevel
import com.jdonee.Requestmap
class BootStrap {
	def springSecurityService
	/**
	 * 初始化
	 */
	def init = { servletContext ->
		switch(GrailsUtil.environment){
			case "development":
				def adminRole = new Role(authority: 'ROLE_ADMIN',alias: '系统管理员').save(flush: true)
				def userRole = new Role(authority: 'ROLE_USER',alias: '普通用户').save(flush: true)
				def testUser1 = new User(username: 'frank', firstName:'爱辉',lastName:'曾',enabled: true, password: springSecurityService.encodePassword('frank'))
				testUser1.save(flush: true)
				def testUser2 = new User(username: 'tina',firstName:'晓婷',lastName:'沈', enabled: true, password: springSecurityService.encodePassword('tina'))
				testUser2.save(flush: true)
				def testUser3 = new User(username: 'alice', firstName:'婷婷',lastName:'沈',enabled: true, password: springSecurityService.encodePassword('alice'))
				testUser3.save(flush: true)
				def testUser4 = new User(username: 'joy',firstName:'小晓',lastName:'沈', enabled: true, password: springSecurityService.encodePassword('joy'))
				testUser4.save(flush: true)
				def testUser5 = new User(username: 'joyce', firstName:'娟娟',lastName:'沈',enabled: true, password: springSecurityService.encodePassword('joyce'))
				testUser5.save(flush: true)
				def testUser6 = new User(username: 'nancy',firstName:'凤燕',lastName:'沈', enabled: true, password: springSecurityService.encodePassword('nancy'))
				testUser6.save(flush: true)
				def testUser7 = new User(username: 'jane', firstName:'雯雯',lastName:'沈',enabled: true, password: springSecurityService.encodePassword('jane'))
				testUser7.save(flush: true)
				def testUser8 = new User(username: 'lori',firstName:'梦琪',lastName:'沈', enabled: true, password: springSecurityService.encodePassword('lori'))
				testUser8.save(flush: true)
				UserRole.create testUser1, adminRole, true
				UserRole.create testUser2, userRole, true
				UserRole.create testUser3, userRole, true
				UserRole.create testUser4, userRole, true
				UserRole.create testUser5, userRole, true
				UserRole.create testUser6, userRole, true
				UserRole.create testUser7, userRole, true
				UserRole.create testUser8, userRole, true
				new Requestmap(description:'JS目录',url: '/js/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY',customed:false).save()
				new Requestmap(description:'CSS目录',url: '/css/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY',customed:false).save()
				new Requestmap(description:'Image目录',url: '/images/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY',customed:false).save()
				new Requestmap(description:'系统登入',url: '/login/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY',customed:false).save()
				new Requestmap(description:'系统登出',url: '/logout/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY',customed:false).save()
				new Requestmap(description:'根目录',url: '/*', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY',customed:false).save()
				new Requestmap(description:'安全测试',url: '/secure/**', configAttribute: 'ROLE_ADMIN,ROLE_USER',customed:true).save()
				new Requestmap(description:'公司管理',url: '/company/**', configAttribute: 'ROLE_ADMIN',customed:true).save()
				new Requestmap(description:'部门管理',url: '/department/**', configAttribute: 'ROLE_ADMIN',customed:true).save()
				new Requestmap(description:'角色管理',url: '/role/**', configAttribute: 'ROLE_ADMIN',customed:true).save()
				new Requestmap(description:'权限管理',url: '/requestmap/**', configAttribute: 'ROLE_ADMIN',customed:true).save()
				new Requestmap(description:'用户管理',url: '/user/**', configAttribute: 'ROLE_ADMIN',customed:true).save()
				new Requestmap(description:'岗位管理',url: '/job/**', configAttribute: 'ROLE_ADMIN',customed:true).save()
				new Requestmap(description:'系统考核管理',url: '/performance/**', configAttribute: 'ROLE_ADMIN',customed:true).save()
				new Requestmap(description:'考核报表管理',url: '/report/**', configAttribute: 'ROLE_ADMIN',customed:true).save()
				new Requestmap(description:'考核模板管理',url: '/systemTemplate/**', configAttribute: 'ROLE_ADMIN',customed:true).save()
				new Requestmap(description:'考核规则管理',url: '/scoreLevel/**', configAttribute: 'ROLE_ADMIN',customed:true).save()
				new Requestmap(description:'个人信息管理',url: '/personInfo/**', configAttribute: 'ROLE_ADMIN,ROLE_USER',customed:true).save()
				new Requestmap(description:'个人指标管理',url: '/personalPerformance/**', configAttribute: 'ROLE_ADMIN,ROLE_USER',customed:true).save()
				new Requestmap(description:'企业价值观管理',url: '/companyRule/**', configAttribute: 'ROLE_ADMIN,ROLE_USER',customed:true).save()
				new Requestmap(description:'KPI指标管理',url: '/kpiRule/**', configAttribute: 'ROLE_ADMIN,ROLE_USER',customed:true).save()
				new Requestmap(description:'岗位职责管理',url: '/jobRule/**', configAttribute: 'ROLE_ADMIN,ROLE_USER',customed:true).save()
				new Requestmap(description:'周边评价管理',url: '/jobRuleScore/**', configAttribute: 'ROLE_ADMIN,ROLE_USER',customed:true).save()
				new Requestmap(description:'个人考核管理',url: '/myPersonPerformance/**', configAttribute: 'ROLE_ADMIN,ROLE_USER',customed:true).save()
				new Requestmap(description:'周边考核管理',url: '/peripheralPersonPerformance/**', configAttribute: 'ROLE_ADMIN,ROLE_USER',customed:true).save()
				new Requestmap(description:'下级考核管理',url: '/superiorPersonPerformance/**', configAttribute: 'ROLE_ADMIN,ROLE_USER',customed:true).save()
				def company1=new Company(name:'艾实实业上海总公司',code:'01')
				company1.save(flush: true)
				def company2=new Company(name:'艾实实业北京分公司',code:'02')
				company2.save(flush: true)
				def department1=new Department(company:company1,code:'0101',name:'总经理办公室')
				department1.save(flush: true)
				def department2=new Department(company:company1,code:'0102',name:'人事部')
				department2.save(flush: true)
				def department3=new Department(company:company1,code:'0103',name:'财务部')
				department3.save(flush: true)
				def department4=new Department(company:company2,code:'0201',name:'销售部')
				department4.save(flush: true)
				def department5=new Department(company:company2,code:'0202',name:'市场部')
				department5.save(flush: true)
				def jobType1= new JobType(name:'综合管理类')
				jobType1.save(flush: true)
				def jobType2= new JobType(name:'职能管理类')
				jobType2.save(flush: true)
				def jobType3= new JobType(name:'专业管理类')
				jobType3.save(flush: true)
				def jobType4= new JobType(name:'市场营销类')
				jobType4.save(flush: true)
				def jobType5= new JobType(name:'生产运营类')
				jobType5.save(flush: true)
				def jobType6= new JobType(name:'技术类')
				jobType6.save(flush: true)
				def jobType7= new JobType(name:'作业类')
				jobType7.save(flush: true)
				def job1=new Job(name:'市场部经理',code:'0202-02',user:testUser1,company:company2,department:department5,jobType:jobType4,companyResponsible:true)
				job1.save(flush:true)
				def job2=new Job(name:'财务部经理',code:'0103-02',user:testUser2,company:company1,department:department3,jobType:jobType1)
				job2.save(flush:true)
				def job3=new Job(name:'销售部经理',code:'0201-02',user:testUser3,company:company2,department:department4,jobType:jobType4)
				job3.save(flush:true)
				def job4=new Job(name:'总经理秘书',code:'0101-03',user:testUser4,company:company1,department:department1,jobType:jobType1)
				job4.save(flush:true)
				def job5=new Job(name:'市场总监',code:'0202-01',user:testUser5,company:company2,department:department5,jobType:jobType4)
				job5.save(flush:true)
				def job6=new Job(name:'人事总监',code:'0102-01',user:testUser6,company:company1,department:department2,jobType:jobType1)
				job6.save(flush:true)
				def job7=new Job(name:'财务总监',code:'0103-01',user:testUser7,company:company1,department:department3,jobType:jobType1)
				job7.save(flush:true)
				def job8=new Job(name:'总经理',code:'0101-01',user:testUser8,company:company1,department:department1,jobType:jobType1)
				job8.save(flush:true)
				def job9=new Job(name:'总经理助理',code:'0101-02',user:testUser3,company:company1,department:department1,jobType:jobType1)
				job9.save(flush:true)
				def job10=new Job(name:'市场部专员',code:'0202-03',user:testUser4,company:company2,department:department5,jobType:jobType4)
				job10.save(flush:true)
				def job11=new Job(name:'销售部专员',code:'0201-03',user:testUser5,company:company2,department:department4,jobType:jobType4)
				job11.save(flush:true)
				def job12=new Job(name:'人事部专员',code:'0102-03',user:testUser6,company:company1,department:department2,jobType:jobType1)
				job12.save(flush:true)
				def testPerformance=new Performance(name:'第三季度考核',startDate:new Date()+1,endDate:new Date()+2,mainWeight:60,auxiliaryWeight:40,peripheralWeight:50,useTemplate:true)
				testPerformance.save(flush:true)
				def testPersonalPerformance1=new PersonalPerformance(performance:testPerformance,job:job1)
				testPersonalPerformance1.save(flush:true)
				def testPersonalPerformance2=new PersonalPerformance(performance:testPerformance,job:job2)
				testPersonalPerformance2.save(flush:true)
				def testPersonalPerformance3=new PersonalPerformance(performance:testPerformance,job:job3)
				testPersonalPerformance3.save(flush:true)
				def jobSystemTemplate=new SystemTemplate(templateType:TemplateType.JOB,templateContent:'严格按照公司的经营方针、管理流程、规章制度等履行岗位职能；||保质、保量、按时完成工作目标和工作任务；||及时、准确、全面地向上级汇报岗位所辖工作情况或业务完成情况；||严格遵守员工职业道德和行为规范，无违纪违法或有损集团和公司声誉的事。',enabled:true)
				jobSystemTemplate.save(flush:true)
				def ScoreLevelA=new ScoreLevel(level:"A",minValue:90,maxValue:100)
				ScoreLevelA.save(flush:true)
				def ScoreLevelB=new ScoreLevel(level:"B",minValue:80,maxValue:89)
				ScoreLevelB.save(flush:true)
				def ScoreLevelC=new ScoreLevel(level:"C",minValue:70,maxValue:79)
				ScoreLevelC.save(flush:true)
				def ScoreLevelD=new ScoreLevel(level:"D",minValue:60,maxValue:69)
				ScoreLevelD.save(flush:true)
				def ScoreLevelE=new ScoreLevel(level:"E",minValue:0,maxValue:59)
				ScoreLevelE.save(flush:true)
				assert User.count() == 8
				assert Role.count() == 2
				assert UserRole.count() == 8
				assert Company.count() == 2
				assert Department.count() == 5
				assert JobType.count() == 7
				assert Job.count() == 12
				assert Performance.count() == 1
				assert PersonalPerformance.count() == 3
				assert SystemTemplate.count() == 1
				assert ScoreLevel.count() == 5
				break
			case "production" : break
		}
	}
	def destroy = {
	}
}
