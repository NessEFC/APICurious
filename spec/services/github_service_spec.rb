require 'rails_helper'

describe GithubService do

  attr_reader :token

  before do
    @token = ENV['GITHUB_TOKEN']
  end

  context ".github_user_by(token)" do
    it "returns a user's profile information" do
      VCR.use_cassette("GithubService#github_user_by(token)") do
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

  context ".starred(token)" do
    it "returns a user's starred repos" do
      VCR.use_cassette("GithubService#starred(token)") do
        starred_repos = GithubService.starred(token)

        expect(starred_repos).to be_an(Array)
        expect(starred_repos.first).to be_a(Hash)
        expect(starred_repos.last).to be_a(Hash)
        expect(starred_repos[0][:name]).to be_a(String)
      end
    end
  end

  context ".followers(token)" do
    it "returns a user's followers" do
      VCR.use_cassette("GithubService#followers(token)") do
        followers = GithubService.followers(token)

        expect(followers).to be_an(Array)
        expect(followers.first).to be_a(Hash)
        expect(followers.first[:login]).to be_a(String)
      end
    end
  end

  context ".following(token)" do
    it "returns who a user is following" do
      VCR.use_cassette("GithubService#following(token)") do
        following = GithubService.following(token)

        expect(following).to be_an(Array)
        expect(following.first).to be_a(Hash)
        expect(following.first[:login]).to be_a(String)
      end
    end
  end

  context ".repos(token)" do
    it "returns a user's repos" do
      VCR.use_cassette("GithubService#repos(token)") do
        repos = GithubService.repos(token)

        expect(repos).to be_an(Array)
        expect(repos.first).to be_a(Hash)
        expect(repos.first[:name]).to be_a(String)
      end
    end
  end

  context ".orgs(token)" do
    it "returns a user's orgs" do
      VCR.use_cassette("GithubService#orgs(token)") do
        orgs = GithubService.orgs(token)

        expect(orgs).to be_an(Array)
      end
    end
  end

  context ".commits(token, login)" do
    it "returns a user's commits" do
      VCR.use_cassette("GithubService#commits(token, login)") do
        login = "NessEFC"
        commits = GithubService.commits(token, login)

        expect(commits).to be_an(Array)
        expect(commits.first).to be_a(Hash)
        expect(commits.first[:repo][:name]).to be_a(String)
        expect(commits.first[:payload][:commits]).to be_an(Array)
        expect(commits.first[:payload][:commits][0][:message]).to be_a(String)
      end
    end
  end
end
