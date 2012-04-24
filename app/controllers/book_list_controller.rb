class BookListController < ApplicationController
	layout 'main'
	before_filter :authenticate_user!
	
	def show
		@books = Book.find(:all , :conditions => ["name like ? " , "%#{params[:serchInput]}%" ] )
		#@book=Book.where("name like '%?%' ,params[:serchInput] ")
	end
end
