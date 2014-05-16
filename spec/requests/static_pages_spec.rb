require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do
    it "should have the content 'Pinfinity'" do
      visit '/'
      expect(page).to have_content('Pinfinity')
    end

    it "should have the title '| Home'" do
      visit '/'
      expect(page).to have_title('Pinfinity | Home')
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/help'
      expect(page).to have_content('Help')
    end

    it "should have the title '| Help'" do
      visit '/help'
      expect(page).to have_title('Pinfinity | Help')
    end
  end

  describe "About page" do
    it "should have the content 'About'" do
      visit '/about'
      expect(page).to have_content('About')
    end

    it "should have the title '| About'" do
      visit '/about'
      expect(page).to have_title('Pinfinity | About')
    end
  end
end
