class BookMarksController < ApplicationController
	def create
		@book_mark = BookMark.new(params[:book_mark])
		@book_mark.book_id = params[:book_id]
		@book_mark.user_id = current_user.id
		if @book_mark.save
			redirect_to book_path(@book_mark.book)
		end
	end
end
