class GithubUser

  attr_reader :login, :name, :avatar_url, :starred_url, :followers_url, :following_url

  def initialize(attrs = [])
    @attrs = attrs
    @login = attrs[:login]
    @name = attrs[:name]
    @avatar_url = attrs[:avatar_url]
    @starred_url = attrs[:starred_url]
    @followers_url = attrs[:followers_url]
    @following_url = attrs[:following_url]
  end

  def self.find_github_user(token)
    raw_githubuser = GithubService.github_user_by(token)
    new(raw_githubuser)
  end

  private

  attr_reader :attrs

end
