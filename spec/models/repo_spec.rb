require 'rails_helper'

describe Repo do

  attr_reader :token

  before do
    @token = ENV['GITHUB_TOKEN']
  end

  context ".find_repos(token)" do
    it "finds repos associated with a user" do
      VCR.use_cassette("Repo#find_repos(token)") do
        repos = Repo.find_repos(token)

        expect(repos).to be_an(Array)
        expect(repos.first).to be_a(Repo)
        expect(repos.first.name).to be_a(String)
        expect(repos.count).to eq(39)
      end
    end
  end
end
