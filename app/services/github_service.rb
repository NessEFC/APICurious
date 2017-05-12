class GithubService

  def initialize(token)
    @_conn = Faraday.new("https://api.github.com")
    @token = token
  end

  def github_user_by
    response = conn.get("/user", { access_token: token })
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.github_user_by(token)
    service = GithubService.new(token)
    service.github_user_by
  end

  def starred
    response = conn.get("/user/starred", { access_token: token })
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.starred(token)
    service = GithubService.new(token)
    service.starred
  end

  def followers
    response = conn.get("/user/followers", { access_token: token })
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.followers(token)
    service = GithubService.new(token)
    service.followers
  end

  def following
    response = conn.get("/user/following", { access_token: token })
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.following(token)
    service = GithubService.new(token)
    service.following
  end

  def repos
    response = conn.get("user/repos", { access_token: token, per_page: 100 })
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.repos(token)
    service = GithubService.new(token)
    service.repos
  end

  def orgs
    response = conn.get("user/orgs", { access_token: token })
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.orgs(token)
    service = GithubService.new(token)
    service.orgs
  end

  def commits(token, login)
    response = conn.get("/users/#{login}/events", { access_token: token })
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.commits(token, login)
    service = GithubService.new(token)
    service.commits(token, login)
  end

  private

  attr_reader :token

  def conn
    @_conn
  end

end
