require 'spec_helper'

describe User do

  before do
    @user = User.new(username: "Tester", email: "test@example.com", password: "foobarbaz")
  end

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:admin) }
  it { should respond_to(:pins) }

  it { should be_valid }

  describe "when email is not present" do
    before { @user.email = "" }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = "" }
    it { should_not be_valid }
  end

  describe "pin associations" do

    before { @user.save }
    let!(:older_pin) do
      FactoryGirl.create(:pin, user: @user, created_at: 1.day.ago)
    end

    let!(:newer_pin) do
      FactoryGirl.create(:pin, user: @user, created_at: 1.hour.ago)
    end

    it "should have the pins in the right order" do
      expect(@user.pins.to_a).to eq [newer_pin, older_pin]
    end

    it "should destroy associated pins" do
      pins = @user.pins.to_a
      @user.destroy
      expect(pins).not_to be_empty
      pins.each do |pin|
        expect(Pin.where(id: pin.id)).to be_empty
      end
    end
  end
end
