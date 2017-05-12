class Repo

  attr_reader :token, :name, :owner

  def initialize(token, attrs={})
    @token = token
    @attrs = attrs
    @name = attrs[:name]
    @owner = attrs[:owner][:login]
  end

  def self.find_repos(token)
    GithubService.repos(token).select { |repo| repo[:owner][:login] == "NessEFC" }.map { |repo| Repo.new(token, repo) }
  end

  private

  attr_reader :attrs

end
