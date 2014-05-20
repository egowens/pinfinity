require 'spec_helper'

describe User do

  before do
    @user = User.new(email: "test@example.com", password: "foobarbaz")
  end

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }

  it { should be_valid }

  describe "when email is not present" do
    before { @user.email = "" }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = "" }
    it { should_not be_valid }
  end
end
