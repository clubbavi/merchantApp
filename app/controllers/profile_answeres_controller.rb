class ProfileAnsweresController < ApplicationController
  before_action :set_profile_answere, only: [:show, :edit, :update, :destroy]

  # GET /profile_answeres
  # GET /profile_answeres.json
  def index
    @profile_answeres = ProfileAnswere.all
  end

  # GET /profile_answeres/1
  # GET /profile_answeres/1.json
  def show
  end

  # GET /profile_answeres/new
  def new
    @profile_answere = ProfileAnswere.new
  end

  # GET /profile_answeres/1/edit
  def edit
  end

  # POST /profile_answeres
  # POST /profile_answeres.json
  def create
    @profile_answere = ProfileAnswere.new(profile_answere_params)

    respond_to do |format|
      if @profile_answere.save
        format.html { redirect_to @profile_answere, notice: 'Profile answere was successfully created.' }
        format.json { render :show, status: :created, location: @profile_answere }
      else
        format.html { render :new }
        format.json { render json: @profile_answere.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile_answeres/1
  # PATCH/PUT /profile_answeres/1.json
  def update
    respond_to do |format|
      if @profile_answere.update(profile_answere_params)
        format.html { redirect_to @profile_answere, notice: 'Profile answere was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile_answere }
      else
        format.html { render :edit }
        format.json { render json: @profile_answere.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_answeres/1
  # DELETE /profile_answeres/1.json
  def destroy
    @profile_answere.destroy
    respond_to do |format|
      format.html { redirect_to profile_answeres_url, notice: 'Profile answere was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_answere
      @profile_answere = ProfileAnswere.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_answere_params
      params.require(:profile_answere).permit(:profile_id, :question_id, :answere)
    end
end
