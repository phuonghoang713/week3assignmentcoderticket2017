class SessionsController < ApplicationController

    def create
      if @user = User.find_by(email: params[:email])
        if @user.authenticate(params[:password])
          flash[:success] = "Signed in successfully."
          session[:user_id] = @user.id
          redirect_to events_path

        else
          flash.now[:error] = "Wrong Password."
          render 'new'
        end
      else
        flash.now[:error] = "User not Found"
        render 'new'
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_path, flash: {success: "You Are Signed Out"}
    end
end
