require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }

  describe 'included modules' do
    it { should have_secure_password }
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username).case_insensitive }
    it { should validate_length_of(:username).is_at_most(50) }

    it { should validate_length_of(:password).is_at_least(8) }
  end
end
