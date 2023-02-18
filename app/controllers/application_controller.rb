class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
      flash[:success]="ログインしました"
      users_my_page_path(current_user)
  end

  def after_sign_out_path_for(resource)
      flash[:success]="ログアウトしました"
      root_path
  end
end
