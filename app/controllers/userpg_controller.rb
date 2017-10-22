
class UserpgController < ApplicationController
  def index
  	$score=0
	$truth=0
	$chng=0
	if Genre.first!=nil
		$lbqgen=State.where(genre: Genre.first.name).joins("JOIN users ON users.id=states.userid").select('states.score,users.name as name,states.userid as id').order(score: :desc).uniq.pluck(:name,:score)
	end
	if SubGenre.first!=nil
		$lbqsubgen=State.where(subgenre: SubGenre.first.subgen).joins("JOIN users ON users.id=states.userid").select('states.score,users.name as name,states.userid as id').order(score: :desc).uniq.pluck(:name,:score)
	end
	if Genre.first!=nil
		$lb_curgen=Genre.first.name
	end
	if SubGenre.first!=nil
		$lb_cursubgen=SubGenre.first.subgen
	end
	$by=1
	@abc=State.where(userid:session[:user_id])
  end
end
