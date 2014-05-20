require 'spec_helper'
describe UserRepository do
  describe "creating a user" do
    let(:user) { User.new(name: 'bob') }

    it "sets a remember token" do
      u = UserRepository.create(user)
      u.remember_token.wont_be_nil
    end

    it "sets created_at and updated_at" do
      u = UserRepository.create(user)
      u.created_at.wont_be_nil
      u.updated_at.wont_be_nil
    end
  end

end
