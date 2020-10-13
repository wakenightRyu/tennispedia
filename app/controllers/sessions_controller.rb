class SessionsController < ApplicationController

    def new
        if current_user
            redirect_to "/users/#{@user.slug}"
        else
            @user=User.new
            render 'new'
        end
    end

    def create
        if @user=User.find_by(name: params[:user][:name])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id]=@user.id
                redirect_to "/users/#{@user.slug}"
            end 
        else 
            flash[:message] = "Invalid login. Please try again."
                redirect_to "/login"
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