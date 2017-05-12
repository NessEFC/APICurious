class ReposController < ApplicationController
  def index
    @repos = GithubUser.find_github_user(current_user.token).repos
  end
end
