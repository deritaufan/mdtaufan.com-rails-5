require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "has a valid factory" do
  	contact = FactoryGirl.build(:contact)
  	expect(contact).to be_valid
  end
end
