require 'rails_helper'

describe GithubUser do
  context ".find_github_user(token)" do
    it "finds a dang user that matches the token. So cool." do
      token = ENV['GITHUB_TOKEN']
      githubuser = GithubUser.find_github_user(token)

      expect(githubuser.login).to eq("NessEFC")
      expect(githubuser.name).to eq("Craig Ness")
      expect(githubuser.avatar_url).to eq("https://avatars2.githubusercontent.com/u/22826692?v=3")
      expect(githubuser.starred_url).to eq("https://api.github.com/users/NessEFC/starred{/owner}{/repo}")
      expect(githubuser.followers_url).to eq("https://api.github.com/users/NessEFC/followers")
      expect(githubuser.following_url).to eq("https://api.github.com/users/NessEFC/following{/other_user}")
    end
  end
end
