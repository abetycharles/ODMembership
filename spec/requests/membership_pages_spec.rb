require 'spec_helper'

describe "Membership Pages" do
  

  subject { page }

  shared_examples_for "all membership pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home page" do
  	before { visit root_path }
    let(:heading) { 'Membership Management' }
    let(:page_title) { '' }

    it_should_behave_like "all membership pages"

    it "should have the right links on the layout" do

      visit root_path

      click_link "Home"
      page.should have_selector('title', text: full_title(''))

      click_link "About"
      page.should have_selector('title', text: full_title('About Us'))
      
      click_link "Membership Management"
      page.should have_selector('title', text: full_title(''))

      click_link "Sign in!"
      page.should have_selector('title', text: full_title('Sign in'))

      click_link "Help"
      page.should have_selector('title', text: full_title('Help'))

      click_link "Contact"
      page.should have_selector('title', text: full_title('Contact'))




    end

  end

  describe "Help page" do
  	before { visit help_path }
    let(:heading) { 'Help' }
    let(:page_title) { heading }

    it_should_behave_like "all membership pages"

  end
 
  shared_examples_for "About page" do
  	before { visit about_path }
    let(:heading) {'About Us'}
    let(:page_title) { heading }

    it_should_behave_like "all membership pages"

  end

  describe "Contact page" do
  	before { visit contact_path }
    let(:heading) {'Contact'}
    let(:page_title) { heading }

    it_should_behave_like "all membership pages"

  end


  
end
