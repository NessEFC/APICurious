require 'rails_helper'

describe Commit do

  attr_reader :token

  before do
    @token = ENV['GITHUB_TOKEN']
  end

  context ".find_commits(token, login)" do
    it "finds commits associated with a user" do
      VCR.use_cassette("Commit#find_commits(token, login)") do
        login = "NessEFC"
        commits = Commit.find_commits(token, login)

        expect(commits).to be_an(Array)
      end
    end
  end
end
