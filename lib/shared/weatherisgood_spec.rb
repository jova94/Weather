require 'rubygems'
require 'json'

shared_context "login" do |weatherisgood, email, password|
    it "secceeds for user: #{email}" do
        user_login_sucess = false
        output = weatherisgood.login(email, password)
        user_login_sucess = true unless output.nil?
        expect(user_login_sucess).to eq(true)
    end
end

shared_context 'NEG - login' do |weatherisgood, email, password|
    it "does not succeed for invalid user: #{email}" do
        user_login_failure = false
        output = weatherisgood.login(email, password)
        user_login_failure = true if output.nil?
        expect(user_login_failure).to eq(true)
    end
end

shared_context "Create User" do |weatherisgood, firstname, lastname, email, password|
    it "creates user account for user: #{firstname} #{lastname} " do
        user_account_created = false
        output = weatherisgood.crete_user(firstname, lastname, email, password)
        user_account_created = true unless['data'] ['success'].nil?
        expect(user_account_created).to eq(true)
    end
end

shared_context "NEG - Create user (user already exists)" do |weatherisgood, firstname, lastname, email, password|
    it "does not create user account for user: #{firstname} #{lastname} since it already exist" do
        error_message = ""
        output = weatherisgood.create_user(firstname, lastname, email, password)
     if output['data']['success'].nil?
        error_message = output['data']['error']
     end
        expect(error_message).to eq('User already exists!')
    end
end

shared_context "Get weather for city" do |weatherisgood, city|
    it "gets weather forecast for city #{city}" do
     weather_forecast_retrieved = false
     output = weatherisgood.get_weather_today_for_city(city)
     expect(weather_forecast_retrieved).to eq(true)
    end
end
   
shared_context "NEG - Get weather for city" do |weatherisgood, city|
    it "does not get weather forecast for city #{city} that does not exist" do
     error_message = ""
     output = weatherisgood.get_weather_today_for_city(city)
     if output['data']['success'].nil?
      error_message = output['data']['error']
     end
     expect(error_message).to eq('City does not exist!')
    end
end

shared_context "Get user input on weather for city" do |weatherisgood, city|
    it "gets users input on weather forecast for city #{city}" do
     weather_forecast_retrieved = false
     output = weatherisgood.get_users_input_for_weather(city)
     expect(weather_forecast_retrieved).to eq(true)
    end
   end
