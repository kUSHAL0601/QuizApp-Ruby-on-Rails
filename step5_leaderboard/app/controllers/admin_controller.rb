class AdminController < ApplicationController
  def index
  	if session['user_name']!="Admin"
  		redirect_to userpg_index_path
  	else
		$lbqgen=State.where(genre: Genre.first.name).joins("JOIN users ON users.id=states.userid").select('states.score,users.name as name,states.userid as id').order(score: :desc).uniq.pluck(:name,:score)
		$lbqsubgen=State.where(subgenre: SubGenre.first.subgen).joins("JOIN users ON users.id=states.userid").select('states.score,users.name as name,states.userid as id').order(score: :desc).uniq.pluck(:name,:score)
		$lb_curgen=Genre.first.name
		$lb_cursubgen=SubGenre.first.subgen
		$by=1  		
  	end
  end
end