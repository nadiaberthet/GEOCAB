class UsersController < ApplicationController

  def update
    @user = current_user
  end

end
