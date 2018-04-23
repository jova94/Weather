require 'rubygems'
require './lib/weatherisgood_api'
require './lib/shared/weatherisgood_spec'

user = "djole"
password = "mypassword"
city = "Sarajevo"
city_doesnot_exist = "MyCity"
weatherisgood = WeatherIsGoodApi.new

describe "Test Case 1: Login with user and get weather check for city that exists and doesn't exist" do
 context "Login with user #{user}" do
  include_context "Login", weatherisgood, user, password
 end

 context "Get weather for city #{city} that exists" do
  include_context "Get weather for city", weatherisgood, city
 end

 context "Get weather for city #{city_doesnot_exist} that does not exist" do
  include_context "NEG - Get weather for city", weatherisgood, city_doesnot_exist
 end
end