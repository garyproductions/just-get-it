class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  before_action :require_admin, except: [:index, :show]
  before_action :require_mod, except: [:index, :show]

  def show
    @articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created"
      redirect_to @category
    else
      render 'new'
    end
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category was updated successfully."
      redirect_to @category
    else
      render 'edit'
    end
  end

  # def destroy
  #   if @category.destroy
  #     flash[:notice] = "Category was deleted successfully."
  #     redirect_to categories_path
  #   else
  #     flash[:notice] = "Category could NOT be deleted"
  #   end
  # end



  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(logged_in? && (current_user.admin? || current_user.owner?))
      flash[:alert] = "Only admins can perform that action"
      redirect_to categories_path
    end
  end

  def require_mod
    if !(logged_in? && (current_user.admin? || current_user.mod? || current_user.owner?))
      flash[:alert] = "Only mods can perform that action"
      redirect_to categories_path
    end
  end
end
