require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do
	let(:am) { ActionMailer::Base }
  before(:each) do
  	am.delivery_method = :test
    am.perform_deliveries = true
    am.deliveries = []
    @contact_form = create(:contact) #create from FactoryGirl
    ContactMailer.contact_me(@contact_form).deliver
  end

  after(:each) do
  	am.deliveries.clear
  end

  it "sends an email" do
  	expect(am.deliveries.count).to eq 1
  end

  it "sends an email with given details" do
  	expect(am.deliveries.first.to).to eq ["apps@mdtaufan.com"]
  	expect(am.deliveries.first.subject).to eq "Contact form message"
  	expect(am.deliveries.first.from).to eq [@contact_form.email]
  end
end
