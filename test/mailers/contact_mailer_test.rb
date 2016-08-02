require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "contact_me" do
    contact = contacts(:test1)
    mail = ContactMailer.contact_me(contact.name, contact.email, contact.message)
    assert_equal "Contact form message", mail.subject
    assert_equal ["apps@mdtaufan.com"], mail.to
    assert_equal [contact.email], mail.from
    assert_match contact.name, mail.body.encoded
    assert_match contact.email, mail.body.encoded
  end

end
