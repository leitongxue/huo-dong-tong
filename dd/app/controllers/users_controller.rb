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
      cookies.permanent[:token] = @user.token
      redirect_to :root, :notice => "注册成功"
    else
      render :signup
    end
  end

  def creat_login_session
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      cookies.permanent[:token] = user.token
      redirect_to root_url, :notice => "登录成功"
    else
      flash[:error] = "无效的用户名和密码"
      redirect_to :login
    end
  end

  def logout
    cookies.delete(:token)
    redirect_to :root, :notice => "已经退出登录"
  end

end