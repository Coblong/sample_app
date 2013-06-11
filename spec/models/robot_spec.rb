require 'spec_helper'

describe Robot do
  let(:user) { FactoryGirl.create(:user) }
  before { @robot = user.robots.build() }
  
  subject { @robot }

  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should respond_to(:timeframe) }
  it { should respond_to(:symbol) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @robot.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Robot.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when user_id is not present" do
    before { @robot.user_id = nil }
    it { should_not be_valid }
  end
end
