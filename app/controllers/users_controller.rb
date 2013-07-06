class UsersController < ApplicationController

  respond_to :json

  def destroy
    respond_with current_user.destroy
  end

end
