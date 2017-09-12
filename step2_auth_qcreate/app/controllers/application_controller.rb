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
end