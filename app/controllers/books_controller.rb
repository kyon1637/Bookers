class BooksController < ApplicationController
	def new
		@book = Book.new
    end

    def create
    	@book = Book.new(book_params)
    	@book.user_id = current_user.id
    if  @book.save
    	flash[:notice] = "Book was successfully created."
       redirect_to books_path
   else
   	   @books = Book.all
   	    @book = Book.new
        render :index
    end
    end

    def index
    	@books = Book.all
    	@book = Book.new
    end

    def show
    end

    private
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
