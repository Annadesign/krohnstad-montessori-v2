class Admin::ArticlesController < Admin::ApplicationController
  before_action :set_admin_article, only: [:show, :edit, :update, :destroy]

  # GET /admin/articles
  # GET /admin/articles.json
  def index
   # @articles = Article.where(:publish => :true)
     @articles = Article.list

  end

  def show
  
  end

  def new
    @article = Article.new
  end

  def edit

    @article = Article.find(params[:id])
  end


  def create
    @article = Article.new(article_params)
     @article.moderator_id = current_moderator.id
    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_articles_url, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    
    if @article.update(article_params)
      redirect_to edit_admin_article_url(@article), notice: 'Artikkelen: ' + article_params[:title] + ' ble oppdatert!'
    else
      flash[:alert] = 'Det var et problem med oppdateringen'
      render :edit
    end
   
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_url(cat: params[:category_id]), notice: 'Artikkelen ble slettet!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :summary, :content, :image, :imagetext, :publish, :category_id, :moderator_id, :imagestyle)
    end
end
