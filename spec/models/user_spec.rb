require 'rails_helper'

RSpec.describe User, type: :model do

  describe User do
    describe "validations" do
      #subject { user = FactoryBot.build(:user) }
      #it { should validate_presence_of(:username) }
      #it { should validate_uniqueness_of(:username).case_insensitive }
      subject {User.new(username: 'test1', password: '123456', email: 'test1@example.com')}
      before {subject.save}
      it 'username should be present' do
        subject.username = nil
        expect(subject).to_not be_valid
      end

      it 'email should be present' do
        subject.email = nil
        expect(subject).to_not be_valid
      end

      it 'username should be present - valid' do
        expect(subject).to be_valid
      end


    end

  end

end
