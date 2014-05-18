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

  describe "persisting followers" do
    let(:user) { User.new(id: 1, name: 'bob') }

    it "persists the followers" do
      user.followers = [User.new(id: 2, name: 'jim')]
      UserRepository.create(user)
      relationship = RelationshipRepository.last
      relationship.follower_id.must_equal 1
      relationship.followed_id.must_equal 2
    end
  end
end
