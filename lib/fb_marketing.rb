require 'fb_graph2'
require 'active_support'
require 'active_support/core_ext'
require 'rack/oauth2'

module FbMarketing
	 class << self

	 end
end

Dir[File.join(__dir__, 'fb_marketing/*.rb')].each do |file|
  require file
end