class LeaderboardController < ApplicationController
  def index
  end

  def bygen
  	  $lbqgen=State.where(genre: params["gennm"]).joins("JOIN users ON users.id=states.userid").select('states.score,users.name as name,states.userid as id').order(score: :desc).uniq.pluck(:name,:score)
  	  $lb_curgen=params["gennm"]
  	  $by=1
  	  redirect_to leaderboard_index_path
  end

  def bysubgen
  	  print params
	  $lbqsubgen=State.where(subgenre: params["subgennm"]).joins("JOIN users ON users.id=states.userid").select('states.score,users.name as name,states.userid as id').order(score: :desc).uniq.pluck(:name,:score)
  	  $lb_cursubgen=params["subgennm"]
  	  $by=2
  	  redirect_to leaderboard_index_path
  end
end