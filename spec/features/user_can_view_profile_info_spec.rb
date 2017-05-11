require 'rails_helper'

RSpec.feature "User sees their profile information" do
  context "An existing user" do
    scenario "visits their dashboard page" do
      VCR.use_cassette("dashboard") do
        Capybara.app = Apicurious::Application
        stub_omniauth

        visit '/'

        expect(page.status_code).to eq(200)

        click_link("Sign in with GitHub")

        expect(current_path).to eq(dashboard_path)
        expect(page).to have_css('img[src*="https://avatars2.githubusercontent.com/u/22826692?v=3"]')
        expect(page).to have_content("Craig Ness")
        expect(page).to have_content("NessEFC")
        expect(page).to have_content("Stars: 2")
        expect(page).to have_content("Followers(2): BethKnight1234 VictoriaVasys")
        expect(page).to have_content("Following(2): samlandfried lukyans")
      end
    end
  end
end
