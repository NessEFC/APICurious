FactoryGirl.define do
  factory :user do
    uid "1234"
    username "NessEFC"
    token "#{ENV['GITHUB_TOKEN']}"
  end
end
