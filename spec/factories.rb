FactoryGirl.define do
  factory :link do
    url "MyString"
    title "MyString"
  end
  factory :user do
    first_name "MyString"
    last_name "MyString"
    username "MyString"
    password_digest "MyString"
  end
end