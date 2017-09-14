class AdminController < ApplicationController
  def index
  	if session['user_name']!="Admin"
  		redirect_to userpg_index_path
  	end
  end
end