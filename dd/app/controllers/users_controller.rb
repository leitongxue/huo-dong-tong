#encoding: utf-8
class UsersController < ApplicationController
  def welcome
  end

  def signup
    @user=User.new
  end

  def login
  end

  def create
    @user=User.new(params[:user])
    if @user.save
      redirect_to :root, :notice => "注册成功"
    else
      render :signup
    end
  end
end