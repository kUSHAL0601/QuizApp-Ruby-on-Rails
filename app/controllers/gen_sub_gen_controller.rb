class GenSubGenController < ApplicationController
  def create
    $top_gen=params["gennm"]
    $show_subgen=SubGenre.where(gen: $top_gen)
    redirect_to new_mcq_path(anchor: 'Genre')
  end
end