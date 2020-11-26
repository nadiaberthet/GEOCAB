class UsersController < ApplicationController
  before_action :current, only: [:edit, :update]
  before_action :user_params, only: [:edit, :update]


  def edit
  end

  def update
  end

  def dashboard
  end

  private

  def current
    @user = current_user
  end

  def user_params
    params.require(@user).permit(:ordre, :cpam, :urssaf, :retraite, :assurance_rcp, :budget, :commodite) #doesn't work needs something else
  end
end