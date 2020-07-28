class UsersController < ApplicationController
before_action :ensure_correct_user, only: [:edit,:update]

def index
		@users = User.all
    @book = Book.new
    @user = current_user

	end
    def show
    	@book = Book.new
      @user = User.find(params[:id])

    end


   def new
   end

   def edit
    @user = User.find(params[:id])
   end
   
   def update
      @user = User.find(params[:id])
      if @user.update(user_params)
         redirect_to user_path(@user.id)
         flash[:notice]='You have updated user successfully.'
      else 
        render :edit
      end

   end

    def ensure_correct_user
         @user = User.find(params[:id])
        if  @user.id != current_user.id
          redirect_to "/users/#{current_user.id}"
       end
    end



private
    def user_params
        params.require(:user).permit(:name, :image, :introduction)
    end

    
end
