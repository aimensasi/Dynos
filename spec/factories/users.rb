# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  role            :string
#

FactoryGirl.define do
  factory :user do
    sequence (:email) {|n| "adam#{n}@gmail.com"}
    password "AsW12345"
    role "individual"
  end
end
