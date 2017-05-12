class Org

  def self.find_orgs(token)
    GithubService.orgs(token)
  end

end
