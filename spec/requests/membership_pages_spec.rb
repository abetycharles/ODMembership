require 'spec_helper'

describe "Membership Pages" do
  

  subject { page }

  shared_examples_for "all membership pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "home page" do
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

      click_link "Sign up"
      page.should have_selector('title', text: full_title('Sign up'))

      click_link "Help"
      page.should have_selector('title', text: full_title('Help'))

      click_link "Contact"
      page.should have_selector('title', text: full_title('Contact'))

    end

  end

  describe "help page" do
  	before { visit help_path }
    let(:heading) { 'Help' }
    let(:page_title) { heading }

    it_should_behave_like "all membership pages"

  end
 
  shared_examples_for "about page" do
  	before { visit about_path }
    let(:heading) {'About Us'}
    let(:page_title) { heading }

    it_should_behave_like "all membership pages"

  end

  describe "contact page" do
  	before { visit contact_path }
    let(:heading) {'Contact'}
    let(:page_title) { heading }

    it_should_behave_like "all membership pages"

  end

  describe "profile page" do
    let(:member) { FactoryGirl.create(:member) }
    before { visit member_path(member) }

    it { should have_selector('h1', text: member.lastname )}
    it { should have_selector('title', text: member.lastname )}
  end

  describe "signup" do
    before { visit signup_path }
    let(:submit) { "Create my account" }

    describe "with invalid information" do

      it "should not create a user" do
        expect { click_button submit }.not_to change(Member, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Firstname", with: "Charles"
        fill_in "Lastname", with: "Abety"
        fill_in "Email", with: "charlesabety@yahoo.com"
        fill_in "Password", with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(Member, :count).by(1)
      end
    end
  end
  
end
