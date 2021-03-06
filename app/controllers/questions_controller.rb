class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    # @questions = Question.all
    @questions = Question.order(:created_at).page params[:page]
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @sections = []
    @question = Question.new
    @type = ["Textbox","Dropdown","Listbox","Radiobutton","Checkbox"]
    if params[:pro_id]
      @pro_id = params[:pro_id]
      @pro_id.delete_at 0
      products = Product.find(@pro_id)
      products.each do |p|
        if p != ''
          @sections << p.sections.all
          @sections = @sections.uniq { |x| x[:id] }
        end
      end
    end    
  end

  # GET /questions/1/edit
  def edit
    @type = ["Textbox","Dropdown","Listbox","Radiobutton","Checkbox"]
    @sections = []
   if params[:pro_id]
      @pro_id = params[:pro_id]
      @pro_id.delete_at 0
      products = Product.find(@pro_id)
      products.each do |p|
        if p != ''
          @sections << p.sections.all
          @sections = @sections.uniq { |x| x[:id] }
        end
      end
    end    
    
    # @selected_id = []
    # @selected_product_id = []
    # @sections = Section.all
    # puts @question.sections.inspect
    # @question.sections.each do |secid|
      # @selected_id << secid.id
    # end
     # @question.products.each do |proid|
      # @selected_product_id << proid.id
    # end
  end

  # POST /questions
  # POST /questions.json
  def create
    if params[:product].blank?
      flash[:alert] = "Please select atleast one Product"
      redirect_to new_question_path
    else
      if params[:section].blank?
        flash[:alert] = "Please select atleast one Section"
        redirect_to new_question_path
      else  
        products = Product.find(params[:product])
        @section = Section.find(params[:section]) if params[:section].present?
        @question = Question.new(question_params)

        respond_to do |format|
          if @question.save
            @question.sections << @section
            @question.products << products
            format.html { redirect_to questions_url, notice: 'Question was successfully created.' }
            format.json { render :index, status: :created, location: @question }
          else
            format.html { render :new }
            format.json { render json: @question.errors, status: :unprocessable_entity }
          end
        end     
      end  
    end  
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    if params[:product].blank?
      flash[:alert] = "Please select atleast one Product"
      redirect_to new_question_path
    else
      if params[:section].blank?
        flash[:alert] = "Please select atleast one Section"
        redirect_to new_question_path
      else  
    @product = Product.find(params[:product])
    @section = Section.find(params[:section])
    @question.sections = @section
    @question.products = @product
    @question.save    
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to questions_url, notice: 'Question was successfully updated.' }
        format.json { render :index, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
    end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:name, :question, :section, :question_type, :answere, :question_value)
    end
end
