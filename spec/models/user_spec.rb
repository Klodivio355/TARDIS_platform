require 'rails_helper'

#RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
#end

describe User do

  describe '#validate_username' do
    it 'Checks if username already exists when signing up' do
      user = User.new(email: 'krusha.aria99@gmail.com')
      expect(user.validate_username) == nil
    end

    it 'Checks if new username does not exists when signing up' do
      user = User.new(email: 'krusha.aria@gmail.com')
      expect(user.validate_username) == nil
    end


  end



end
