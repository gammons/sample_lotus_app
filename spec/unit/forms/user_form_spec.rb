require 'spec_helper'

def validate_presence(attr)
  form.validate(valid_data.merge(attr => nil)).must_equal false
  form.errors.full_messages.must_include "#{attr.to_s.capitalize.gsub(/_/, ' ')} can't be blank"
end

describe 'UserForm' do
  let(:user) { User.new }
  let(:form) { UserForm.new(user) }

  let(:valid_data) do
    {name: 'bob', email: 'test@test.com', password: 'asdfasdf', password_confirmation: 'asdfasdf'}
  end

  it 'is valid with valid data' do
    form.validate(valid_data).must_equal true
  end

  describe 'name validation' do
    it 'validates presence of a users name' do
      validate_presence(:name)
    end
  end

  describe 'email validation' do
    it 'validates presence of a users email' do
      validate_presence(:email)
    end

    it 'validates format of a users email' do
      form.validate(valid_data.merge(email: 'bad')).must_equal false
      form.errors.full_messages.must_include 'Email is invalid'
    end
  end

  describe 'password validation' do
    it 'validates length of password' do
      form.validate(valid_data.merge(password: 'asdf')).must_equal false
      form.errors.full_messages.must_include 'Password is too short (minimum is 6 characters)'
    end

    it 'validates presence of password confirmation' do
      validate_presence(:password_confirmation)
    end
  end
end
