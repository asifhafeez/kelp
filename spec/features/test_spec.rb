require 'spec_helper'
describe "the signin process", :type => :feature do
 

   it "page has text" do
   visit '/'
   expect(page).to have_text("Welcome aboard")
  end
end