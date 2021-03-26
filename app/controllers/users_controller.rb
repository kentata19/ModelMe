class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.order('created_at DESC')
    @supports = @user.supports.order('created_at DESC')
    @rights = @user.rights.order('created_at DESC')
  end
  def right
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.order('created_at DESC')
    @supports = @user.supports.order('created_at DESC')
    @rights = @user.rights.order('created_at DESC')
    @sympathies = @user.sympathies.order('created_at DESC')
    
  end
  def sympathy
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.order('created_at DESC')
    @supports = @user.supports.order('created_at DESC')
    @rights = @user.rights.order('created_at DESC')
    @sympathies = @user.sympathies.order('created_at DESC')
    
  end
  def wish
    @user = User.find_by(id: params[:id])
    @rights = Right.where(owner: @user.id).order('created_at DESC')
    
  end
end
