class HomeController < ApplicationController
  def index
    @userId = current_user.id
    @projects = Project.where("OwnerUserId = " + @userId.to_s + " And enable = 0")
  end
end
