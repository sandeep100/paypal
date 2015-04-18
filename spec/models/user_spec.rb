# require 'spec_helper'
require "rails_helper" 
require 'factory_girl_rails'
describe User do
	it "has a valid user" do
	  FactoryGirl.create(:user).should be_valid
	end
	it "is invalid without a firstname" do
		FactoryGirl.build(:user, email: nil).should_not be_valid
	end
	it { should have_one(:attorney).dependent(:destroy) }
end