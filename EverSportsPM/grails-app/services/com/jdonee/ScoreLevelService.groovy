package com.jdonee

class ScoreLevelService {

    static transactional = true
	
	def getLevelByScore(score){
		def level=null
		ScoreLevel.list().each { scoreLevel->
				if(score>=scoreLevel.minValue&&score<=scoreLevel.maxValue){
					level=scoreLevel.level
				}
			 }
		return level
	}

}
