class HomeController < ApplicationController
  def show
  	@games = Game.all
  	# raise params 
  end
end
