# == Schema Information
#
# Table name: members
#
#  id         :integer         not null, primary key
#  firstname  :string(255)
#  lastname   :string(255)
#  middlename :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Member do
  
  before { @member = Member.new(lastname: "Abety", 
  	firstname: "Charles", middlename: "N/A", 
  	email: "charlesabety@yahoo.com",
  	password: "foobar", password_confirmation: "foobar")}

  subject { @member }

  it { should respond_to(:lastname) }
  it { should respond_to(:firstname) }
  it { should respond_to(:middlename) }
  it { should respond_to(:email) } 
  it { should respond_to(:password_digest)}
  it { should respond_to(:password_confirmation)}
  it { should respond_to(:authenticate)}

  it { should be_valid }

  describe "when firstname is not present" do
  	before { @member.firstname = " " }

  	it { should_not be_valid }
  end

  describe "when firstname is too long" do
  	before { @member.firstname = "a" * 51 }

  	it { should_not be_valid } 
  end


  describe "when lastname is not present" do

  	before { @member.lastname =" " }

  	it { should_not be_valid }
  end

  describe "when lastname is too long" do 
  	before { @member.lastname = "a" * 51 }

  	it { should_not be_valid }
  end 

  describe "when email is not present" do

  	before { @member.email = " " }
  	it { should_not be_valid }
  end

  describe "when email address is already taken" do
  	before do 
  		a = @member.dup 
  		a.email = @member.email.upcase
  		a.save
  	end

  	it { should_not be_valid }

  end

  describe "when password is empty" do
  	before { @member.password = @member.password_confirmation = " " }

  	it { should_not be_valid }
  end

  describe "when password does not match confirmation" do
  	before { @member.password_confirmation = "mismatch" }

  	it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
  	before { @member.password_confirmation = nil }

  	it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @member.save }
    let(:found_user) { Member.find_by_email(@member.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@member.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { @member.authenticate('invalid') }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end

  describe "when password is too short" do
    before { @member.password = @member.password_confirmation = "a" * 5 }

    it { should_not be_valid }
  end
  
  describe "email address with mixed case" do
    let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

    it "should be saved as all lower-case" do
      @member.email = mixed_case_email
      @member.save

      @member.reload.email.should == mixed_case_email.downcase
    end
  end

end
