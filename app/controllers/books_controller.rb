class BooksController < ApplicationController
  layout 'main'
  before_filter :authenticate_user!
	
  # GET /books
  # GET /books.json
  def index
    @books = Book.all
	@popbooks = randth(@books)[0,8]
	@waterbooks = @books[0,20]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])
	@mycomment = Comment.find(:all ,:conditions =>["book_id = ? and user_id = ?", @book.id , current_user.id])
	@comment = Comment.new
	@comments = Comment.find(:all , :conditions =>["book_id =? and user_id != ?" ,@book.id ,current_user.id])
	@note = BookMark.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, :notice => 'Book was successfully created.' }
        format.json { render :json => @book, :status => :created, :location => @book }
      else
        format.html { render :action => "new" }
        format.json { render :json => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, :notice => 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end
  
  def see_more_books
	tmp = params[:totalBooks].to_i
	@morebooks = Book.all[tmp,10]
	if @morebooks.blank?
		render "more_books.js.erb"
	else
		render "more_books.html.erb"
	end
  end
  
  def randth(arr)
	randarr=Array.new
	tmp=Array.new
	s=arr.size-1
	p s
	for i in 0..s
		r=rand(s+1)
	if tmp[r]!=1
		randarr.push(arr[r])
		tmp[r]=1
	else
		redo
	end
		i=i+1
	end
		return randarr 
  end 
end
