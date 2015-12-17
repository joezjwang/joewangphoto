class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :published_check, only: [:show]
  before_filter :authenticate, only: [:create, :update]

  # GET /posts
  # GET /posts.json
  def index
    if Post.exists?
      @posts = Post.where(Published: true).order("published_at" + " " + "desc")
      @post_most_recent=@posts.first
    end
    
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @posts = Post.where.not(id: @post.id).where(Published: true).order("published_at" + " " + "desc")
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # # GET /posts/1/edit
  # def edit
  # end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        if params[:images]
        params[:images].each { |image|
          @post.blogimages.create(image: image)
        }
      end

        format.html { redirect_to new_admin_post_url, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        if params[:images]
        #update will add more images if images are selected for upload.
        params[:images].each { |image|
          @post.blogimages.create(image: image)
        }
      end
        format.html { redirect_to admin_post_url(@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  # def destroy
  #   @post.destroy
  #   respond_to do |format|
  #     format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
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
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :published, :published_at, :taken_at)
    end

    def published_check
      unless @post.published
        redirect_to posts_url, notice: 'Post does not exist or is at an unpublished state.'
      end
    end
end
