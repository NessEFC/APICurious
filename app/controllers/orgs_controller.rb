class OrgsController < ApplicationController
  def index
    @orgs = GithubUser.find_github_user(current_user.token).orgs
  end
end
