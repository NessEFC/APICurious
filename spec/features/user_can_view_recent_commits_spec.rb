require 'rails_helper'

RSpec.feature "User sees their recent commits" do
  context "An existing user" do
    scenario "visits their dashboard page" do
      VCR.use_cassette("user_commits") do
        Capybara.app = Apicurious::Application
        stub_omniauth

        visit '/'

        expect(page.status_code).to eq(200)

        click_link("Sign in with GitHub")

        expect(page.status_code).to eq(200)
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("APICurious: add orgs and repos")
        expect(page).to have_content("APICurious: add all profile info endpoints")
        expect(page).to have_content("APICurious: implement github omniauth")
        expect(page).to have_content("Merge pull request #1 from NessEFC/omniauth")
      end
    end
  end
end
