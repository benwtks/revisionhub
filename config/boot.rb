ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require "bootsnap/explicit_require"
Bootsnap::ExplicitRequire.singleton_class.prepend(Module.new do
  def with_gems(*gems, &body)
    super(
      *gems.map do |gem|
        case gem
        when "msgpack" then "msgpack-ruby"
        else gem
        end
      end,
      &body
    )
  end
end)