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
  if(Genre.first.to_s != nil.to_s)
    $top_gen=Genre.first.name
  end
  $show_subgen=SubGenre.where(gen: $top_gen)
  if(Genre.first.to_s != nil.to_s)
    $quiz_top_gen=Genre.first.name
  end
  $quiz_show_subgen=SubGenre.where(gen: $quiz_top_gen)
  $cur_gen=""
  $cur_subgen=""
  $cur_qid=0
  $truth=0
  $lb_gen=Genre.all
  $lb_subgen=SubGenre.all
  if(Genre.first!=nil)
    $lbqgen=State.where(genre: Genre.first.name).joins("JOIN users ON users.id=states.userid").select('states.score,users.name as name,states.userid as id').order(score: :desc).uniq.pluck(:name,:score)
  end
  if(SubGenre.first!=nil)
    $lbqsubgen=State.where(subgenre: SubGenre.first.subgen).joins("JOIN users ON users.id=states.userid").select('states.score,users.name as name,states.userid as id').order(score: :desc).uniq.pluck(:name,:score)
  end
  if(Genre.first != nil)
    $lb_curgen=Genre.first.name
  end
  if(SubGenre.first!=nil)
    $lb_cursubgen=SubGenre.first.subgen
  end
  $by=0
  $l1=0
  $l2=0
end