class UsersController < ApplicationController
  def new
  	 @user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

   def create
    @user = User.new(user_params)    
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Brisk-le"
      redirect_to @user
    else
      render 'new'
    end
  end

   def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :username, :used)
    end

    def index
      @users = User.order(:username).limit(50)
    end

    def search
      respond_to do |format|
        format.html
        format.json { @users = User.search(params[:term]) }
      end
    end
end
