class GithubService

  def initialize(token)
    @_conn = Faraday.new("https://api.github.com")
    @token = token
  end

  def github_user_by(token)
    response = conn.get("/user", { access_token: token })
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.github_user_by(token)
    service = GithubService.new(token)
    service.github_user_by(token)
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

  private

  attr_reader :token

  def conn
    @_conn
  end

end
