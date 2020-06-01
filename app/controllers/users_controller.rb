class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "ユーザーを登録しました。"
    else
      flash.now[:alert] = "ユーザー登録に失敗しました。"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: "ユーザーを更新しました。"
    else
      flash.now[:alert] = "ユーザーの更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path, notice: "ユーザーを削除しました。"
    else
      flash.now[:alert] = "ユーザーの削除に失敗しました。"
      render :index
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :age)
  end
end
