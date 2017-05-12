require 'rails_helper'

RSpec.feature "User sees their repos" do
  context "An existing user" do
    scenario "visits their repos page" do
      VCR.use_cassette("user_repos") do
        Capybara.app = Apicurious::Application
        stub_omniauth

        visit '/'

        expect(page.status_code).to eq(200)

        click_link("Sign in with GitHub")

        visit '/repos'

        expect(page.status_code).to eq(200)
        expect(current_path).to eq(repos_path)
        expect(page).to have_content("APICurious")
        expect(page).to have_content("rails_engine")
      end
    end
  end
end
