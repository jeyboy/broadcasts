FactoryGirl.define do
  factory :admin_user, class: Broadcasts::AdminUser do
    sequence(:email) {|n| "ad#{n}@gmail.com"}
    password '123456'
    password_confirmation '123456'
  end
end