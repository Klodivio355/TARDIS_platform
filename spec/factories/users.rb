# == Schema Information
#
# Table name: Users
#
#  id          :integer          not null, primary key
#  email       :string
#  password    :string
#  username    :string
#  admin       :boolean
#
# Indexes
#
#  index_users_on_email  (email)
#  index_users_on_reset_password_token (reset_password_token)
#  index_users_on_username (username)
#
require 'rails_helper'

FactoryBot.define do
  factory :user do
    email {"dm@example.com"}
    password {"password1"}
    username {"test1"}
    admin {false}
  end
end
