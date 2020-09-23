class UsersController < ApplicationController

    def show
        
        @user=User.find_by_slug(params[:id])
        
    end

    def new
        
    end

    def create
        @user=User.new(user_params)

        if @user.valid?
            if params[:user][:password]==params[:user][:password_confirmation]
                @user=User.create(user_params)
                session[:user_id]=@user.id 
                redirect_to "/users/#{@user.slug}"
            else 
                render :new 
            end 
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
