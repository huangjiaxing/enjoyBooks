class UsersController < ApplicationController
  def  index
       @user = User.new
  end

  def create
	  @user=User.new(params[:user])	
      @user.save
      render "index"
  end
  
  def test
	#render params[:limit]
	#render :json =>params[:limit]
	#render "test.js"
  end
end
