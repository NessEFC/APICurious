class GithubUser

  attr_reader :token, :login, :name, :avatar_url, :starred_url, :followers_url, :following_url

  def initialize(attrs = {}, token)
    @attrs = attrs
    @token = token
    @login = attrs[:login]
    @name = attrs[:name]
    @avatar_url = attrs[:avatar_url]
    @starred_url = attrs[:starred_url]
    @followers_url = attrs[:followers_url]
    @following_url = attrs[:following_url]
  end

  def self.find_github_user(token)
    raw_githubuser = GithubService.github_user_by(token)
    new(raw_githubuser, token)
  end

  def starred(token)
    raw_starred = GithubService.starred(token)
  end

  def followers(token)
    GithubService.followers(token).map(&create_github_user(token))
  end

  def following(token)
    GithubService.following(token).map(&create_github_user(token))
  end

  def repos
    Repo.find_repos(token)
  end

  def orgs
    Org.find_orgs(token)
  end

  def commits
    Commit.find_commits(token, login)
  end

  def create_github_user(token)
    -> user { GithubUser.new(user, token) }
  end

  private

  attr_reader :attrs

end
