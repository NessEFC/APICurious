require 'rails_helper'

describe GithubService do
  context ".github_user_by(token)" do
    it "returns a user's profile information" do
      token = ENV['GITHUB_TOKEN']
      githubuser = GithubService.github_user_by(token)

      expect(githubuser).to be_a(Hash)
      expect(githubuser).to have_key(:login)
      expect(githubuser).to have_key(:id)
      expect(githubuser).to have_key(:name)
      expect(githubuser).to have_key(:avatar_url)
      expect(githubuser).to have_key(:starred_url)
      expect(githubuser).to have_key(:followers)
      expect(githubuser).to have_key(:following)
      expect(githubuser[:login]).to be_a(String)
      expect(githubuser[:id]).to be_an(Integer)
      expect(githubuser[:name]).to be_a(String)
      expect(githubuser[:avatar_url]).to be_a(String)
      expect(githubuser[:starred_url]).to be_a(String)
      expect(githubuser[:followers]).to be_an(Integer)
      expect(githubuser[:following]).to be_an(Integer)
    end
  end
end
