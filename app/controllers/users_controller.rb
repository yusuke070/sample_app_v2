class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)    # 実装は終わっていないことに注意!
    if @user.save
      # 保存の成功をここで扱う。
     
      #redirect_to @user  # user_path(@user)　と同じ。 userの場合は省略できる
      flash[:success] = "登録成功です"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private
  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end