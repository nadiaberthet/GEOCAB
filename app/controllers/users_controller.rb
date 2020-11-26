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
    params.require(:user).permit(:job, :ordre, :cpam, :urssaf, :retraite, :assurance_rcp, :budget, :commodite) #doesn't work needs something else
  end
end
