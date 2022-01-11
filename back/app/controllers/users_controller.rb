class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login, :login_form]}
  before_action :ensure_correct_user_to_user, {only: [:edit, :update]}
  def index
    @users = User.all.order(created_at: :desc)
  end
  def show
    @user = User.find_by(id: params[:id])
    @match_user = false
    if @current_user
      if @current_user.id == @user.id
        @match_user = true
      end
    end
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー情報の編集が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render :new
    end
  end
  def edit
    @user = User.find_by(id: params[:id])
  end
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if @user.save
      flash[:notice] = "ユーザー情報の新規登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render :edit
    end
  end
  def login_form
    
  end
  def login
    @error_message = "メールアドレスまたはパスワードが間違っています"
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインできました"
      redirect_to("/items/index")
    else
      
      # flash[:error] = "メールアドレスまたはパスワードが間違っています"
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render :login_form
    end
  end
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/logout")
  end
end
