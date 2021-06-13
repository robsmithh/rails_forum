require 'rails_helper'

describe User, type: :model do

  describe 'confirms validations for user model' do
    describe '.validations' do
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:username) }
      it { should validate_presence_of(:password) }

      it { should allow_value('a' * 35).for(:first_name) }
      it { should_not allow_value('a' * 36).for(:first_name) }

      it { should allow_value('a' * 35).for(:last_name) }
      it { should_not allow_value('a' * 36).for(:last_name) }

      it { should allow_value('test_user@example.com').for(:email) }
      it { should allow_value('test_user@example.co.uk').for(:email) }
      it { should_not allow_value('test_user@example.com.').for(:email) }
      it { should_not allow_value('test_user@example.'). for(:email) }
      it { should_not allow_value('test_user@example').for(:email) }
      it { should_not allow_value('testuser@').for(:email) }
      it { should_not allow_value('').for(:email) }
    end
  end
end
