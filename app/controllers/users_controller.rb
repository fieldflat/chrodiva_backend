class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  # {
  #   "user": {
  #     "name": "Tomonori HIRATA",
  #     "uid": "Tomonori_uid",
  #     "twitter_uid": "Tomonori_twitter_uid",
  #     "password": "Password",
  #     "password_confirmation": "Password"
  #   }
  # }
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(uid: params[:uid])
    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      head :no_content, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :uid, :twitter_uid,
                                   :password_confirmation)
    end

end
