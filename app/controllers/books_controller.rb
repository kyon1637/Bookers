class BooksController < ApplicationController
	def new
		@book = Book.new
    end

    def create
    	@book = Book.new(book_params)
    	@book.user_id = current_user.id
    if  @book.save
    	flash[:notice] = 'You have created book successfully.'
       redirect_to user_path
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
     def destroy
     book = Book.find(params[:id])
     book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
    end

    private
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
