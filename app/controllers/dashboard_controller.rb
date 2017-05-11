class DashboardController < ApplicationController
  def index
    @user = GithubUser.find_github_user(current_user.token)
  end
end
