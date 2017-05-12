require 'rails_helper'

RSpec.feature "User sees their organizations" do
  context "An existing user" do
    scenario "visits their organizations page" do
      VCR.use_cassette("user_orgs") do
        Capybara.app = Apicurious::Application
        stub_omniauth

        visit '/'

        expect(page.status_code).to eq(200)

        click_link("Sign in with GitHub")

        visit '/orgs'

        expect(page.status_code).to eq(200)
        expect(current_path).to eq(orgs_path)
        expect(page).to have_content("You do not belong to any organizations.")
      end
    end
  end
end
