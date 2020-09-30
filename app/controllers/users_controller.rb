class UsersController < ApplicationController

    def show
        @user=User.find(session[:user_id])
       
    end

    def new
        if logged_in?
            @user=current_user
            redirect_to "/users/#{@user.slug}"
        else
            @user=User.new
            render 'new'
        end
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

    def remove
        @video=Video.find_by(id: params[:id])
        @player=@video.player
        @user=current_user
        @user.videos.delete(@video)
        render :show
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
