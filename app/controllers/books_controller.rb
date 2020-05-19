class BooksController < ApplicationController
	def new
		@book = Book.new
    end

    def create
    	@book = Book.new(book_params)
    	@book.user_id = current_user.id
    if  @book.save
    	flash[:notice] = 'You have created book successfully.'
       redirect_to book_path(@book)
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
        @book = Book.find(params[:id])
    end
     def destroy
     book = Book.find(params[:id])
     book.destroy
     flash[:notice] = 'Book was successfully destroyed.'
    redirect_to user_path(current_user.id)
    end

    def ensure_correct_user
    @book = Book.find_by(id:params[:id])
    if @book.user_id = @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/books/index")
    end
    end

    def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

    private
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
