class QuotesController < ApplicationController

  get '/quotes' do
    if logged_in?
      erb :"/quotes/index"
    else
      redirect "/login"
    end
  end
end
