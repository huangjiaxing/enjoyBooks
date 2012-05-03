class ProfilesController < ApplicationController
 
  def index
	@profiles = User.find(params[:id]).profile
  end

end
