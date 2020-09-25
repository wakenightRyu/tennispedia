class SessionsController < ApplicationController

    def new
        if logged_in?
            @user = current_user
            redirect_to "/users/#{@user.slug}"
        else
            render 'new'
        end
    end

    def create
        if params[:user][:name].blank? || params[:user][:password].blank?
            redirect_to '/login'
        else
            if @user=User.find_by(name: params[:user][:name]) #check if user exists in database 
                if @user.authenticate(params[:user][:password])
                    session[:user_id]=@user.id
                    redirect_to "/users/#{@user.slug}"
                else
                redirect_to '/login'
                end
            end
        end
    end

    def destroy
        session.delete :user_id
        redirect_to '/login'
    end

end