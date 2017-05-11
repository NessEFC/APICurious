def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
                                       provider: 'github',
                                       uid: '22826692',
                                       info: {
                                        nickname: 'NessEFC'
                                       },
                                       credentials: {
                                         token: ENV['GITHUB_TOKEN']
                                       }
  })
end
