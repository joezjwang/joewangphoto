class Admin::BlogimagesController < AdminController
  before_action :set_blogimage, only: [:show, :edit, :update, :destroy]

  # GET /blogimages
  # GET /blogimages.json
  def index
    @blogimages = Blogimage.all
  end

  # GET /blogimages/1
  # GET /blogimages/1.json
  def show
  end

  # GET /blogimages/new
  def new
    @blogimage = Blogimage.new
  end

  # GET /blogimages/1/edit
  def edit
  end

  # POST /blogimages
  # POST /blogimages.json
  # def create
  #   @blogimage = Blogimage.new(blogimage_params)

  #   respond_to do |format|
  #     if @blogimage.save
  #       format.html { redirect_to @blogimage, notice: 'Blogimage was successfully created.' }
  #       format.json { render :show, status: :created, location: @blogimage }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @blogimage.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /blogimages/1
  # # PATCH/PUT /blogimages/1.json
  # def update
  #   respond_to do |format|
  #     if @blogimage.update(blogimage_params)
  #       format.html { redirect_to @blogimage, notice: 'Blogimage was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @blogimage }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @blogimage.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /blogimages/1
  # DELETE /blogimages/1.json
  def destroy
    @blogimage.destroy
    respond_to do |format|
      format.html { redirect_to admin_blogimages_url, notice: 'Blogimage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blogimage
      @blogimage = Blogimage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blogimage_params
      params.require(:blogimage).permit(:title, :caption, :preview_color, :image)
    end
end
