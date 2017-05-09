require 'rails_helper'

feature "User can log in with GitHub" do
  context "An existing user can login" do

    before do
      Capybara.app = Apicurious::Application
      stub_omniauth
    end

    scenario "Logging In" do
      visit '/'

      expect(page.status_code).to eq(200)

      click_link "Sign in with GitHub"

      expect(current_path).to eq(root_path)
      expect(page.body).to have_content("Logged in as C-Rage")
      expect(page.body).to have_link("Logout")
    end

    def stub_omniauth
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
                                           provider: 'github',
                                           uid: '1234',
                                           info: {
                                            nickname: 'C-Rage'
                                           },
                                           credentials: {
                                             token: 'thisistoken'
                                           }
      })
    end

  end
end
