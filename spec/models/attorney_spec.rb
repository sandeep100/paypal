require "rails_helper" 
require 'factory_girl_rails'
describe Attorney do
	it "Attorney a valid user" do
	  FactoryGirl.create(:attorney).should be_valid
	end
end