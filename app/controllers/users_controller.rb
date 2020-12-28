class UsersController < ApplicationController
  def index
    #render plain: 'hello, world!'
    @num = 10 + 1

    @users = User.all

  end
end
