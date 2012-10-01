require 'spec_helper'

describe "Membership Pages" do

  subject { page }

  describe "Home page" do
  	before { visit root_path }

    it { should have_selector('h1', text: 'Membership App') }
    it { should have_selector('title', text: 'Membership App | Home') }
    
  end

  describe "Help page" do
  	before { visit help_path }

  	it { should have_selector('h1', text: 'Help') }
  	it { should have_selector('title', text: 'Membership App | Help') }
  end
 
  describe "About Page" do
  	before { visit about_path }

  	it { should have_selector('h1', text: 'About Us')  }
  	it { should have_selector('title', text: 'Membership App | About Us') }
  end
  
end
