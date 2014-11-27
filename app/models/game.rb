class Game < ActiveRecord::Base
	has_many :plays

	# Create a high score method that finds the best scores in each game
	def highscore
		plays = self.plays.order("score desc").limit(5)	#Orders by score in descending
		return plays.to_a
	end
end
