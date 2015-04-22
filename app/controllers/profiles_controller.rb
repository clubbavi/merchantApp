class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @category = Category.all
    @profile = Profile.new
     @questions_arr = []
     @sections  = []

    if params[:cat_id]
      @cat_id =  params[:cat_id]
      category = Category.find(params[:cat_id])
      @product = category.products.all
      puts @product.inspect
    end

    if params[:pro_id]
      @pro_id = params[:pro_id]
      params[:pro_id].delete_at 0
      products = Product.find(params[:pro_id])
      puts products.inspect
      products.each do |p|
      if p != ''
      @sections << p.sections.all
      puts @sections.inspect      
      # puts "------------------------------"  
      # if @sections    
      # @sections.each do |sect|
        # puts sect.inspect
           # sect.each do |sec|
             # @que = sec.questions.all
             # @que.each do |que|
               # puts que.inspect
               # @profile.que.build
             # end
           # end
      # end
      # end
      # puts "------------------------------"  
      
      end
      end
          
    end

     
  end

  def product_selection
    puts "product selection"
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    respond_to do |format|
        if @profile.save   
          if params[:q]      
        params[:q].each do |key,value|
        puts "Param #{key}: #{value}"
        question_answeres = ProfileAnswere.new
        question_answeres.profile_id = @profile.id
        question_answeres.question_id = key
        question_answeres.answere = value
        question_answeres.save
        puts question_answeres.inspect      
        end
        end
    
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(:name, :email, :category_id, :product_id, :section_id, :question_id)
  end
end
