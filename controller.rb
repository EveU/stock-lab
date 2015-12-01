require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'yahoofinance'
require 'pry-byebug'

get '/' do
  erb :home
end

get '/stock_app' do
  @stock_code = params[:stock_code]
  # binding.pry
  @last_trade = YahooFinance::get_standard_quotes(@stock_code)[@stock_code].lastTrade
  @name = YahooFinance::get_standard_quotes(@stock_code)[@stock_code].name
  erb :stock_app
end