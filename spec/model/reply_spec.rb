require 'rails_helper'

describe Reply, type: :model do

  describe 'confirms validations for reply model' do
    describe '.validations' do
      it { should validate_presence_of(:comment) }
    end
  end
end
