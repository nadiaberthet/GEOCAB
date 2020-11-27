class UsersController < ApplicationController

  def edit
  end

  def update
    current_user.update(user_params)
  end

  def dashboard
  end

  private

  def user_params
    params.require(:users).permit(:job)
  end
end
