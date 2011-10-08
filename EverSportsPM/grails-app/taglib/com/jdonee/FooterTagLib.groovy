package com.jdonee

class FooterTagLib {
	def thisYear={
		out << new Date().format("yyyy")
	}

	def copyRight={attrs,body->
		out << "&copy;"+attrs.startYear+"-"
		out << this.thisYear() +" "+body()
	}
}
