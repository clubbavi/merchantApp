class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  # GET /sections
  # GET /sections.json
  def index
    # @sections = Section.all
    @sections = Section.order(:created_at).page params[:page]
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
  end

  # GET /sections/new
  def new
    @products = Product.all
    @section = Section.new
  end

  # GET /sections/1/edit
  def edit
    @selected_id = []
    @products = Product.all
    puts"===================="
    puts @section.products.inspect
    @section.products.each do |proid|
    @selected_id << proid.id
    end
  end

  # POST /sections
  # POST /sections.json
  def create
   if params[:product].blank?
      flash[:alert] = "Please select atleast one Product"
      redirect_to new_section_path
    else
    @product = Product.find(params[:product])
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
         @section.products << @product
        format.html { redirect_to sections_url, notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
   end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
      @product = Product.find(params[:product])
     @section.products = @product
      puts"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
     puts @section.save
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to sections_url, notice: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_url, notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:name, :description)
    end
end
