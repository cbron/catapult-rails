require "net/http"
require "uri"
require 'catapult/catapult_methods'
require 'catapult/subscription'
require 'catapult/campaign'
require 'catapult/version'


module Catapult
  mattr_accessor :username, :password
  BaseUrl = "http://www.vibescm.com"
end