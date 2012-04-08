class HomeController < ActionController::Base
	layout "application"
  def index
	    if user_signed_in?
           redirect_to  "/books"
      end
  end
end
