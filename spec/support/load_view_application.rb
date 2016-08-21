RSpec.configure do |config|

  config.before(:each, type: :view) do
    view.lookup_context.prefixes << 'application'
  end
end