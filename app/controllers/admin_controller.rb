class AdminController < ApplicationController
  def login
    if request.post?
         user = User.yanzhen(params[:email],params[:password])
       if user
         session[:user_id] = user.id
       end
    end
  end

  def logout
  end

  def index
  end

end
