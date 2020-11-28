class UsersController < ApplicationController
before_action :current, only: [:edit, :update]

  def edit
  end

  def update
    if current_user.budget == nil
      @user.update(user_params)
      redirect_to questionnaire2_searches_path

    elsif current_user.budget == 0
      @user.update(user_params)
      redirect_to questionnaire2_searches_path

    else
      @user.update(user_params)
      redirect_to todo_lists_path
    end
  end

  def dashboard
  end

  private

  def current
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:job, :ordre, :cpam, :urssaf, :retraite, :assurance_rcp, :budget, :commodite) #doesn't work needs something else
  end
end
