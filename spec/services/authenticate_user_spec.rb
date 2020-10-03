require 'rails_helper'

RSpec.describe AuthenticateUser do
  let!(:user) { create(:user, username: 'user1', password: '12345678') }
  let(:valid_attrs) { { username: 'user1', password: '12345678' } }

  describe '#call' do
    context 'when username and password are correct' do
      it 'successfully authenticates user' do
        authenticate_user = AuthenticateUser.call(attrs: valid_attrs)

        expect(authenticate_user.user.id).to eq user.id
      end
    end

    context 'when username is incorrect' do
      it 'raise UnauthorizedError' do
        attrs = { username: 'wrong_username', password: '12345678' }

        expect { AuthenticateUser.call(attrs: attrs) }.to raise_error(UnauthorizedError)
      end
    end

    context 'when password is incorrect' do
      it 'raise UnauthorizedError' do
        attrs = { username: 'user1', password: 'wrong_password' }

        expect { AuthenticateUser.call(attrs: attrs) }.to raise_error(UnauthorizedError)
      end
    end
  end
end