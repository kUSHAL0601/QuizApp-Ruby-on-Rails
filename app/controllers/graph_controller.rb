class GraphController < ApplicationController
  def getchart
  	@qry=State.where(subgenre: $cur_subgen,genre: $cur_gen).joins("JOIN users ON users.id=states.userid").select('states.score,users.name as name,states.userid as id').order(score: :desc).uniq.pluck(:name,:score)
  	array=[["User","Score"]]
  	@qry.each do |s|
  		array << s
  	end
  	print "\n\n\n\n\n\n\n\n\n"
  	render json: array
  end
end