class SessionsController < ApplicationController

  def new
  end

  def create
    # データベースには小文字で保存している
    user = User.find_by(email: params[:session][:email].downcase) 
    # 検索結果が正しく、なおかつ、パスワードと一致しているのか。
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      
      log_in(user)
      
      redirect_to user
    else
      # エラーメッセージを作成する
      flash.now[:danger] = 'ログインに失敗しました' # 本当は正しくない
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end