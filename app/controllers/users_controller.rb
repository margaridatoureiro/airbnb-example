class UsersController < ApplicationController
  def flat_owners
    @users = User.where(role: 'owner')
  end

  def flat_customers
    @users = User.where(role: 'customer')
  end

  def show
    @user = User.find(params[:id])
  end
end
