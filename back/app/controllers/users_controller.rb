class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
  end
  def show
    @user = User.find_by(id: params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(name: params[:name], email: params[:email])
    if @user.save
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
  
end
