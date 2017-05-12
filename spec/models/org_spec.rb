require 'rails_helper'

describe Org do

  attr_reader :token

  before do
    @token = ENV['GITHUB_TOKEN']
  end

  context ".find_orgs(token)" do
    it "finds orgs associated with a user" do
      VCR.use_cassette("Org#find_orgs(token)") do
        orgs = Org.find_orgs(token)

        expect(orgs).to be_an(Array)
        expect(orgs.count).to eq(0)
      end
    end
  end
end
