class UsersController < ApplicationController

  def destroy
    @user = User.find_by_id(current_user.id)
    @user.destroy

    redirect_to root_path
  end

end
