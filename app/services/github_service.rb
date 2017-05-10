class GithubService

  def initialize
    @_conn = Faraday.new("https://api.github.com")
  end

  def github_user_by(token)
    response = conn.get("/user", { access_token: token })
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.github_user_by(token)
    service = GithubService.new
    service.github_user_by(token)
  end

  private

  def conn
    @_conn
  end

end
