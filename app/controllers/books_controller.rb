class BooksController < ApplicationController
 before_action :ensure_correct_user, only: [:edit,:destroy,:update]

	def new
		@book = Book.new
	end
	def create
		@book = Book.new(book_params)
		@books = Book.all
		@user = current_user
        @book.user_id = current_user.id
        if @book.save
        	flash[:notice]='You have creatad book successfully.'
           redirect_to book_path(@book.id)
        else
        	render :index
        end

	end

    def edit
        @book = Book.find(params[:id])
    end

	def index
		@books = Book.all
		@book = Book.new
		@user = current_user

	end
    def show
    	@book = Book.find(params[:id])
    	@user = current_user
    	@book_new = Book.new
    end

        def destroy
    	book = Book.find(params[:id])
        book.destroy
        redirect_to '/books'
    end

     def update
     	 @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:notice]='successfully'
           redirect_to "/books/#{@book.id}"
        else
           render "edit"
        end
     end

     def ensure_correct_user
         @book = Book.find(params[:id])
        if  @book.user_id != current_user.id
     	    redirect_to "/books"
        end
     end

private
    def book_params
        params.require(:book).permit(:title, :body, :user_id)
    end



end
