require 'spec_helper'

describe "AuthenticationPages" do

  subject { page }

  describe "signup page" do
    before { visit '/sign_up' }
    it { should have_content('Sign Up Now!') }
    it { should have_title('Sign Up') }
  end
end
