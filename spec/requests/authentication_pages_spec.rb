require 'spec_helper'

describe "AuthenticationPages" do

  subject { page }

  describe "signup page" do
    before { visit '/sign_up' }
    it { should have_content('Sign Up Now!') }
    it { should have_title('Sign Up') }
  end


  describe "signin page" do
    before { visit '/signin' }
    it { should have_content('Sign In') }
    it { should have_title('Sign In') }
  end

  describe "Sign Up" do

    before { visit '/sign_up' }

    describe "with invalid information" do
      before { click_button "Sign up" }

      it { should have_content("Email can't be blank") }
      it { should have_content("Password can't be blank") }
      it { should have_selector("div.alert.alert-error") }
    end

    describe "with valid information" do
      before do
        fill_in "user_email",                  with:   "tester@example.com"
        fill_in "user_password",               with:   "foobarbaz"
        fill_in "user_password_confirmation",  with:   "foobarbaz"
        click_button "Sign up"
      end

      it { should have_title("Home") }
      it { should have_selector("div.alert.alert-notice") }
    end
  end

  describe "Sign In" do

    before { visit '/signin' }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_content("Invalid email or password") }
      it { should have_selector("div.alert.alert-alert") }
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }

      before do
        fill_in "user_email",     with: user.email
        fill_in "user_password",  with: user.password
        click_button "Sign in"
      end

      it { should have_content("Signed in successfully") }
      it { should have_selector("div.alert.alert-notice") }
      it { should_not have_content("Sign in") }
    end
  end

  describe "Sign out" do
    before do
      visit '/signin'
      user = FactoryGirl.create(:user)
      fill_in "user_email",     with: user.email
      fill_in "user_password",  with: user.password
      click_button "Sign in"
      click_link "Sign out"
    end

    it { should have_content("Signed out successfully") }
    it { should have_selector("div.alert.alert-notice") }
  end
end
