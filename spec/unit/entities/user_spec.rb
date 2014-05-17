require 'spec_helper'

describe User do
  let(:user) { User.new }

  describe "#admin?" do
    it "returns false by default" do
      user.admin?.must_equal false
    end

    it "returns true if user is admin" do
      user.admin = true
      user.admin?.must_equal true
    end

    it "returns false if user is not admin" do
      user.admin = false
      user.admin?.must_equal false
    end

  end
end
