class GenresController < ApplicationController
  before_action :set_genre, only: [:show, :edit, :update, :destroy]

  # GET /genres
  # GET /genres.json
  def index
  end

  # GET /genres/1
  # GET /genres/1.json
  def show
  end

  # GET /genres/new
  def new
    @genre = Genre.new
  end

  # GET /genres/1/edit
  def edit
  end

  # POST /genres
  # POST /genres.json
  def create
    if params[:genre][:name] == ""
      print "Param missing"
      redirect_to new_genre_path, alert:"All fields are necessary!"
    else
      @genre = Genre.new(genre_params)

      respond_to do |format|
        if @genre.save
          format.html { redirect_to genres_path, alert: 'Genre was successfully created.' }
          format.json { render :show, status: :created, location: @genre }
        else
          format.html { render :new }
          format.json { render json: @genre.errors, status: :unprocessable_entity }
        end
      end
      $genres = Genre.all
    end
  end

  # PATCH/PUT /genres/1
  # PATCH/PUT /genres/1.json
  def update
    respond_to do |format|
      if @genre.update(genre_params)
        format.html { redirect_to genres_url, notice: 'Genre was successfully updated.' }
        format.json { render :show, status: :ok, location: @genre }
      else
        format.html { render :edit }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
    $genres = Genre.all
  end

  # DELETE /genres/1
  # DELETE /genres/1.json
  def destroy
    SubGenre.where(gen: @genre.name).destroy_all();
    Mcq.where(gen: @genre.name).destroy_all();

    @genre.destroy
    respond_to do |format|
      format.html { redirect_to genres_url, notice: 'Genre was successfully destroyed.' }
      format.json { head :no_content }
    end
    $genres = Genre.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      @genre = Genre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def genre_params
      params.require(:genre).permit(:name)
    end
end