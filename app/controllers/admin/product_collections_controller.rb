class Admin::ProductCollectionsController < AdminController
  before_action :set_product_collection, only: [:show, :edit, :update, :destroy]

  # GET /product_collections/new
  def new
    @product_collection = ProductCollection.new
  end

  # GET /product_collections/1/edit
  def edit
  end

  # DELETE /product_collections/1
  # DELETE /product_collections/1.json
  def destroy
    @product_collection.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: 'Product Collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_collection
      @product_collection = ProductCollection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_collection_params
      params.require(:product_collection).permit(:name, :description, :shopify_collection_handle, :shopify_embed_code)
    end
end
