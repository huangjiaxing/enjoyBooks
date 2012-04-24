class CommentsController < ApplicationController
	def create
		@comment = Comment.new(params[:comment])
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to book_path(@comment.book)
		end
	end
	
	def destroy
		@comment = Comment.find(params[:id])
		url = @comment.book 
		@comment.destroy
		redirect_to book_path(url)
	end
	
	def edit
		@comment = Comment.find(params[:id])
		render "edit_form.html.erb"
	end
	
	def update
    @comment = Comment.find(params[:id])

      if @comment.update_attributes(params[:comment])
        redirect_to book_path(@comment.book)
      end
    
  end
end
