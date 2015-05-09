class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    # @products = Product.all
    @products = Product.order(:created_at).page params[:page]
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @category = Category.all
    @product = Product.new
    @selected_id = nil
  end

  # GET /products/1/edit
  def edit
    @selected_id = []
    @category = Category.all
    @product.categories.each do |catid|
    @selected_id << catid.id
    end
  end

  # POST /products
  # POST /products.json
  def create
    @category = Category.find(params[:category])
    @product = Product.new(product_params)     
    
    respond_to do |format|
      if @product.save
        @product.categories << @category
        format.html { redirect_to products_url, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
     @category = Category.find(params[:category])
     @product.categories = [@category]
      puts"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
     puts @product.save
    respond_to do |format|
      if @product.update(product_params)
         
        format.html { redirect_to products_url, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description ,:category)
    end
end
