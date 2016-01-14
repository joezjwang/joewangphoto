class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.where({featured: false}).order("created_at" + " " + "desc")
    @featured_product = Product.where({featured: true}).first
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  def new
     @product = Post.new
  end

  # POST /products
  # POST /products.json
  def create
    extract_and_load_shopify_embed_data()
    @product = Product.new(product_params)
    
    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_products_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render new_admin_product_path }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    extract_and_load_shopify_embed_data()
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_products_path, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

def extract_and_load_shopify_embed_data

  if params['shopify_embed_code'].present?
    embed_code=params['shopify_embed_code']
    params['product']['shopify_product_handle']=embed_code[/.*data-product_handle=\"([^\""]*)/,1]
    params['product']['shopify_product_id']=embed_code[/.*joewangphoto.myshopify.com\/cart\/([^:]*)/,1]
    params['product']['name']=embed_code[/.*data-product_name=\"([^\""]*)/,1]
    puts params['product']['shopify_product_handle']
    puts params['product']['shopify_product_id']
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :shopify_product_handle, :shopify_product_id, :shopify_embed_code, :product_photo, :featured)
    end
end
