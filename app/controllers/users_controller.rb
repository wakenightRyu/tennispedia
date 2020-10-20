class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create]
    before_action :find_video, :current_user
    
    def show
        @user_videos_sorted_by_categories= @user.categories.uniq.sort_by{|category| category.name}

        @none_favorited_videos= @user.videos.blank?

        @user_favorited_videos_count = @user.videos.count

    end

    def new
        if current_user
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

    def edit
    end 

    def update
        if @user.update(user_params)
            flash[:message]= 'Player was successfully updated'
            redirect_to "/users/#{@user.slug}"
        else 
            render :edit 
        end
    end

    def remove
        @user.videos.delete(@video)
        redirect_to "/users/#{@user.slug}"
    end

    def cancel 
        redirect_to "/users/#{@user.slug}"
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
