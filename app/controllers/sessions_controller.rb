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
                    flash[:message]="Login error. Please try again."
                    redirect_to '/login'
                end
            end
        end
    end

    def facebook 
        @user = User.find_or_create_by(uid: auth['uid'].to_s) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(10)
        end
       
        session[:user_id]=@user.id
        @user.save
       
        redirect_to "/users/#{@user.slug}"
    end

    def destroy
        session.delete :user_id
        redirect_to '/login'
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end