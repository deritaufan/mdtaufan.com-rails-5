require 'rails_helper'

RSpec.describe Contact, type: :model do
	
	it "has a valid factory" do
  	factory_contact = build(:contact) #build from FactoryGirl
  	expect(factory_contact).to be_valid
  end

	subject { 
		described_class.new(attributes_for(:contact)) #attributes_for from FactoryGirl
	}

  it "is valid with valid attributes" do
  	expect(subject).to be_valid
  end

  it "is not valid without a name" do
  	subject.name = nil
  	expect(subject).to_not be_valid
  end

  it "is not valid without an email" do
  	subject.email = nil
  	expect(subject).to_not be_valid
  end

  it "is not valid withouth a message" do
  	subject.message = nil
  	expect(subject).to_not be_valid
  end

end
