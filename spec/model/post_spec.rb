require 'rails_helper'

describe Post, type: :model do

  describe 'confirms validations for post model' do
    describe '.validations' do
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:post) }
    end
  end
end
