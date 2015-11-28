class CategoriesController < ApplicationController
  
  before_action :require_admin, except: [:index, :show]
  
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(require_params)
    if @category.save
      flash[:success] = "Category Created"
      redirect_to category_path(@category)
    else
      render :new
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update(require_params)
      flash[:success] = "article successfully updated"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end
  
  def show
    @category = Category.find(params[:id])
    @category_articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end
  
  
  private 
  
  def require_params
    params.require(:category).permit(:name)
  end
  
  def require_admin
    if !signed_in? || ( signed_in? && !current_user.admin?)
      flash[:danger] = "Sorry Only Superman can perform this action"
      redirect_to categories_path
    end
  end
  
end