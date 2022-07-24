class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
before_action :require_user, only: [:edit, :update]
before_action :require_same_user, only: [:edit, :update, :destroy]
before_action :require_admin, only: [:promote_mod, :demote_mod]
before_action :require_owner, only: [:promote_admin, :demote_admin]

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the Just Get it site, #{@user.username}, you're now signed up!"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    if @user.destroy
      session[:user_id] = nil if @user == current_user
      flash[:notice] = "Account and all associated articles successfully deleted"
      redirect_to articles_path
    else
    flash[:notice] = "User could NOT be deleted"
    end
  end

  def demote_mod
    @user = User.find(params[:user_id])
    @user.mod = false
    @user.save
    redirect_to user_path(@user)
  end

  def promote_mod
    @user = User.find(params[:user_id])
    @user.mod = true
    @user.save
    redirect_to user_path(@user)
  end

  def demote_admin
    @user = User.find(params[:user_id])
    @user.admin = false
    @user.save
    redirect_to user_path(@user)
  end

  def promote_admin
    @user = User.find(params[:user_id])
    @user.admin = true
    @user.save
    redirect_to user_path(@user)
  end

  private

  def user_params
  params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && (!current_user.admin? && !current_user.owner?)
      flash[:alert] = "You can only edit or delete your own account"
      redirect_to @user
    end
  end

  def require_admin
    if !(logged_in? && (current_user.admin? || current_user.owner?))
      flash[:alert] = "Only admins can perform that action"
      redirect_to users_path
    end
  end

  def require_owner
    if !(logged_in? && current_user.owner?)
      flash[:alert] = "Only owners can perform that action"
      redirect_to users_path
    end
  end

end
