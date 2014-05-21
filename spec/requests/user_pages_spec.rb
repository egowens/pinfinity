require 'spec_helper'

describe 'User pages' do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:p1) { FactoryGirl.create(:pin, user: user, description: "Foo") }
    let!(:p2) { FactoryGirl.create(:pin, user: user, description: "Bar") }

    before { visit user_path(user) }

    it { should have_content(user.username) }
    it { should have_title(user.username) }

    describe "pins" do
      it { should have_content(p1.description) }
      it { should have_content(p2.description) }
      it { should have_content(user.pins.count) }
    end
  end
end
