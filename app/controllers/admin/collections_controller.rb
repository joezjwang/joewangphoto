class Admin::CollectionsController < AdminController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]
  #before_filter :authenticate, only: [:create, :update, :destroy]
  # GET /collections

  # GET /collections
  # GET /collections.json
  def index
    @collections = Collection.all
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
    @photographs=@collection.photographs
    unless @collection.cover_photograph_id.nil?
      @cover_photograph=@collection.photographs.find(@collection.cover_photograph_id)
    end
  end

  # GET /collections/new
  def new
    @collection = Collection.new
  end

  # GET /collections/1/edit
  def edit
  end

  # POST /collections
  # POST /collections.json
  def create
    @collection = Collection.new(collection_params)

    respond_to do |format|
      if @collection.save
        format.html { redirect_to @collection, notice: 'Collection was successfully created!' }

      else
        format.html { render :new }
        
      end
    end
  end

  # PATCH/PUT /collections/1
  # PATCH/PUT /collections/1.json
  def update
    respond_to do |format|
      if @collection.update(collection_params)
        format.html { redirect_to @collection, notice: 'Collection was successfully updated!' }
        # format.json { render :show, status: :ok, location: @collection }
      else
        format.html { render :edit }
        # format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection.destroy
    respond_to do |format|
      format.html { redirect_to admin_collections_url, notice: 'Collection was successfully destroyed!' }
      # format.json { head :no_content }
    end
  end

  protected 
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_params
      params.require(:collection).permit(:name, :description)
    end
end
