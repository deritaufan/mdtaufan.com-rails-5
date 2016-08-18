require 'rails_helper'

RSpec.describe Editor, type: :model do
  it "has a valid Factory Girl" do
  	factory_editor = build(:editor)
  	expect(factory_editor).to be_valid
  end

  subject {
  	described_class.new(attributes_for(:editor))
  }

  it "is valid with valid attributes" do
  	expect(subject).to be_valid
  end

  it "has a name present" do
  	subject.name = nil
  	expect(subject).to_not be_valid
  end

  it "has an email present" do
  	subject.email = nil
  	expect(subject).to_not be_valid
  end

  it "does not have too long name" do
  	subject.name = "a" * 51
  	expect(subject).to_not be_valid
  end

  it "does not have too long email" do
  	subject.email = "a" * 244 + "@mdtaufan.com"
  	expect(subject).to_not be_valid
  end

  it "accepts valid email addresses" do
  	valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.id alice+bob@baz.nl]
    valid_addresses.each do |valid_address|
    	subject.email = valid_address
    	expect(subject).to be_valid, "#{valid_address.inspect} should be valid"
    end
  end

  it "rejects invalid email addresses" do
  	invalid_addresses = %w[user@mdtaufan,com user_at_foo.org user.name@example.
                           foo@bar_baz.nl foo@bar+baz.id foo@bar..com]
    invalid_addresses.each do |invalid_address|
    	subject.email = invalid_address
    	expect(subject).to_not be_valid, "#{invalid_address.inspect} should be invalid"
    end
  end

  it "has email uniqueness" do
  	duplicate_editor = subject.dup
  	duplicate_editor.email = subject.email.upcase
  	subject.save
  	expect(duplicate_editor).to_not be_valid
  end

  it "saves email addresses as lower-case" do
  	mixed_case_email = "DeRI@ExaMPLE.com"
  	subject.email = mixed_case_email
  	subject.save
  	expect(mixed_case_email.downcase).to eq(subject.email)
  end

  it "has non-blank password" do
  	subject.password = subject.password_confirmation = " " * 6
  	expect(subject).to_not be_valid
  end

  it "has a minimum length of password" do
  	subject.password = subject.password_confirmation = "a" * 5
  	expect(subject).to_not be_valid
  end

end
