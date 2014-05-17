require 'spec_helper'
describe "save user integration spec" do
  let(:valid_user) { User.new(name: 'bob') }
  it "saves a user to the database" do
    UserRepository.persist(valid_user)
  end

end
