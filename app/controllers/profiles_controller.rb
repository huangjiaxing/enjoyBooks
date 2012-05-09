class ProfilesController < ApplicationController
	layout 'main'
	before_filter :authenticate_user!
	
	def index
		@profiles = User.find(params[:id]).profile
		@mynotes = BookMark.find(:all , :conditions => ["user_id = ?" , current_user.id])
	end
	
	def change
		@mood = Profile.new();
		@mood.user_id = current_user.id
		@mood.mood = params[:mood]
		@mood.save
		render :json => {:mood => @mood.mood}.to_json
	end
end
