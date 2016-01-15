class ProductCollectionsController < ApplicationController
  before_action :set_product_collection, only: [:show, :edit, :update, :destroy]


  # POST /products
  # POST /products.json
  def create
    #extract_and_load_shopify_embed_data()
    @product_collection = ProductCollection.new(product_collection_params)
    
    respond_to do |format|
      if @product_collection.save
        format.html { redirect_to admin_products_path, notice: 'Product collection was successfully created.' }
        format.json { render :show, status: :created, location: @product_collection }
      else
        format.html { render new_admin_product_collection_path }
        format.json { render json: @product_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    #extract_and_load_shopify_embed_data()
    respond_to do |format|
      if @product_collection.update(product_collection_params)
        format.html { redirect_to admin_products_path, notice: 'Product collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_collection }
      else
        format.html { render :edit }
        format.json { render json: @product_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_collection
      @product_collection = ProductCollection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_collection_params
      params.require(:product_collection).permit(:name, :description, :shopify_collection_handle, :shopify_embed_code, :prominence, :published)
    end
end
