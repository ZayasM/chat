class UsersController < ApplicationController

  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  def user_params
    params.permit(:nick)
  end

end
