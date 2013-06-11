require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    let(:user) { FactoryGirl.create(:user) }
    before { @robot = user.robots.build() }
    before { visit root_path }
    let(:heading)    { 'EA Control' }
    let(:page_title) { '' }    
    it { should have_selector('h2',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }    
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "Sign in"
    page.should have_selector 'title', text: full_title('Sign in')
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "EA Control"
    page.should have_selector 'title', text: full_title('')    
  end
end