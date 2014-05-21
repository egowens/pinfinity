require 'spec_helper'

describe Pin do

  let(:user) { FactoryGirl.create(:user) }

  before { @pin = user.pins.build(equation: "x\; =\; \frac {-b\; \pm\; \sqrt {b^2\; -\; 4ac}}{2a}", description: "The quadratic formula") }

  subject { @pin }

  it { should respond_to(:equation) }
  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user id is not present" do
    before { @pin.user_id = nil }

    it { should_not be_valid }
  end

  describe "when equation is not present" do
    before { @pin.equation = nil }

    it { should_not be_valid }
  end

  describe "when description is not present" do
    before { @pin.description = nil }

    it { should_not be_valid }
  end

  describe "with a description that is too long" do
    before { @pin.description = "a"*141 }

    it { should_not be_valid }
  end
end
