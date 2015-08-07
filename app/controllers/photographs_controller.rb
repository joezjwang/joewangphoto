class PhotographsController < ApplicationController
  before_action :set_photograph, only: [:show, :edit, :update, :destroy]
  #before_filter :authenticate, only: [:create, :update]

  # GET /photographs
  # GET /photographs.json
  def index
    if mobile_device?
      #provide portrait style photos on mobile
      @photographs= Collection.where({name: "mobile"}).first.photographs
    else
      #provide landscape style photos on pc
      @photographs= Collection.where({name: "Portfolio"}).first.photographs
    end
    #where returns an array of active records, thus .first is used to fetch the AR from the array
    #maybe there is a better way of doing this. 
  end

  # GET /photographs/1
  # GET /photographs/1.json
  # def show
  # end 

  # GET /photographs/new
  # def new
  #   @photograph = Photograph.new
  # end

  # # GET /photographs/1/edit
  # def edit
  # end

  # POST /photographs
  # POST /photographs.json
  def create
    @photograph = Photograph.new(photograph_params)

    respond_to do |format|
      if @photograph.save
        format.html { redirect_to admin_photograph_url(@photograph), notice: 'Photograph was successfully created.' }
        format.json { render :show, status: :created, location: @photograph }
      else
        format.html { render :new }
        format.json { render json: @photograph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photographs/1
  # PATCH/PUT /photographs/1.json
  def update
    respond_to do |format|
      if @photograph.update(photograph_params)
        format.html { redirect_to admin_photograph_url(@photograph), notice: 'Photograph was successfully updated.' }
        format.json { render :show, status: :ok, location: @photograph }
      else
        format.html { render :edit }
        format.json { render json: @photograph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photographs/1
  # DELETE /photographs/1.json
  # def destroy
  #   @photograph.destroy
  #   respond_to do |format|
  #     format.html { redirect_to photographs_url, notice: 'Photograph was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  protected 
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photograph
      @photograph = Photograph.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photograph_params
      params.require(:photograph).permit(:title, :description, :photo, :location, collection_ids: [])
    end
end
