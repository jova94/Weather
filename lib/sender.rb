require 'rubygems'
require 'rest_client'
require 'json'
require 'yaml'

class Sender
 attr_reader : server_url

 def initialize
  config_yml = YAML::load(File.open("./config/config.yaml"))
  @server_url = config_yml['environment']['server'].to_s + ":" + config_yml['environment']['port'].to_s
 end

 def send_request(endpoint, method, args={}, headers={})
  unless ['GET','POST','DELETE'].include? method
   raise "Incorrect REST method has been specified"
  end

  if method == 'GET'
   begin
    response = RestClient.get(@server_url + endpoint, headers)
    return JSON.parse(response)
   rescue => e
    return JSON.parse(e.response)
   end

  elsif method == 'POST'
   begin
    response = RestClient.post(@server_url + endpoint, args, headers)
    return JSON.parse(response)
   rescue => e
    return JSON.parse(e.response)
   end
   
  elsif method == 'DELETE'
   begin
    response = RestClient.delete(@server_url + endpoint, headers)
    return JSON.parse(response)
   rescue => e
    return JSON.parse(e.response)
   end
  end
 end
end