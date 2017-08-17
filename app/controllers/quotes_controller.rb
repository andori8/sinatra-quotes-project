class QuotesController < ApplicationController

  get '/quotes' do
    if logged_in?
      erb :"/quotes/index"
    else
      redirect "/login"
    end
  end

  get '/quotes/new' do
    if logged_in?
      erb :"/quotes/new"
    else
      redirect "/login"
    end
  end

  post '/quotes' do
    if params[:content].empty? || params[:author].empty?
      redirect "/quotes/new"
    else
      quote = Quote.create(content: params[:content], author: params[:author], user_id: session[:user_id])
      redirect "/quotes"
    end
  end
end
