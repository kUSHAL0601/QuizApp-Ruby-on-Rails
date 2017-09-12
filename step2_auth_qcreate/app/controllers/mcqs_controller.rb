class McqsController < ApplicationController
  before_action :set_mcq, only: [:show, :edit, :update, :destroy]

  # GET /mcqs
  # GET /mcqs.json
  def index
    @mcqs = Mcq.all
  end

  # GET /mcqs/1
  # GET /mcqs/1.json
  def show
  end

  # GET /mcqs/new
  def new
    @mcq = Mcq.new
  end

  # GET /mcqs/1/edit
  def edit
  end

  # POST /mcqs
  # POST /mcqs.json
  def create
#    if (params[:mcq][:question] == "") or (params[:mcq][:optA] == "") or (params[:mcq][:optB] == "") or(params[:mcq][:optC] == "") or(params[:mcq][:optD] == "") or(params[:mcq][:subgen] == "") 
    @mcq = Mcq.new(mcq_params)

    respond_to do |format|
      if @mcq.save
        format.html { redirect_to @mcq, notice: 'Mcq was successfully created.' }
        format.json { render :show, status: :created, location: @mcq }
      else
        format.html { render :new }
        format.json { render json: @mcq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mcqs/1
  # PATCH/PUT /mcqs/1.json
  def update
    respond_to do |format|
      if @mcq.update(mcq_params)
        format.html { redirect_to @mcq, notice: 'Mcq was successfully updated.' }
        format.json { render :show, status: :ok, location: @mcq }
      else
        format.html { render :edit }
        format.json { render json: @mcq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mcqs/1
  # DELETE /mcqs/1.json
  def destroy
    @mcq.destroy
    respond_to do |format|
      format.html { redirect_to mcqs_url, notice: 'Mcq was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mcq
      @mcq = Mcq.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mcq_params
      params[:mcq][:subgen]=params["subgen"]
      params[:mcq][:gen]=params["gen"]
      params[:mcq][:corrOpt]=params["corropt"]
      params.require(:mcq).permit(:question, :optA, :optB, :optC, :optD, :corrOpt, :subgen, :gen)
    end
end
