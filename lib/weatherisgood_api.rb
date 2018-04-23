require 'rubygems'
require 'json'
require 'sender'

class WeatherIsGoodApi

    attr_reader :sender, :authorization_token

    def initialize
     @sender = Sender.new
    end

    def login(email, password)
        response = @sender.send_request('/auth/login', 'POST', {:email=>email, :password=>password})
        @authorization_token = response['data']['token'] unless response['data']['token'].nil?
    return response['data']['token']
    end

    def logout
        response = @sender.send_request('/auth/logout','POST', {}, {:token=>@authorization_token})
    end

    def create_user(firstname, lastname, email, password)
        response = @sender.send_request('/user/create', 'POST', {:firstname=>firstname, :lastname=>lastname, :email=>email, :password=>password})
    end

    def get_weather_today_for_city(city)
        response = @sender.send_request("/weather/#{city}/today", 'GET', {}, {:token=>@authorization_token})
    end

    def get_users_input_for_weather(city)
        response = @sender.send_request("/weather/#{city}/today/user", 'GET', {}, {:token=>@authorization_token})
    end
end