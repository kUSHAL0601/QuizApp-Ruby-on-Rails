class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize
  protected
  def authorize
  	unless User.find_by(id: session[:user_id])
  		redirect_to login_url, notice:"Unauthorized Access."
  	end
  end
  $genres = Genre.all
  $sub_genres=SubGenre.all
  $top_gen=Genre.first.name
  $show_subgen=SubGenre.where(gen: $top_gen)
  $quiz_top_gen=Genre.first.name
  $quiz_show_subgen=SubGenre.where(gen: $quiz_top_gen)
  $cur_gen=""
  $cur_subgen=""
  $cur_qid=0
  $truth=0
  $lb_gen=Genre.all
  $lb_subgen=SubGenre.all
  $lbqgen=State.where(genre: Genre.first.name).joins("JOIN users ON users.id=states.userid").select('states.score,users.name as name,states.userid as id').order(score: :desc).uniq.pluck(:name,:score)
  $lbqsubgen=State.where(subgenre: SubGenre.first.subgen).joins("JOIN users ON users.id=states.userid").select('states.score,users.name as name,states.userid as id').order(score: :desc).uniq.pluck(:name,:score)
  $lb_curgen=Genre.first.name
  $lb_cursubgen=SubGenre.first.subgen
  $by=0
end