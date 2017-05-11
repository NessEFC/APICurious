require 'rails_helper'

feature "User can log in with GitHub" do
  context "An existing user can login" do
    scenario "Logging In" do
      VCR.use_cassette("login") do
        Capybara.app = Apicurious::Application
        stub_omniauth

        visit '/'

        expect(page.status_code).to eq(200)

        click_link "Sign in with GitHub"

        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("Logged in as NessEFC")
        expect(page).to have_link("Logout")
      end
    end
  end
end
