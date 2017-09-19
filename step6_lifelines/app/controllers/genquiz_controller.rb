class GenquizController < ApplicationController
  def create
    $quiz_top_gen=params["gennm"]
    $quiz_show_subgen=SubGenre.where(gen: $quiz_top_gen)
    redirect_to userpg_index_path
  end
end
