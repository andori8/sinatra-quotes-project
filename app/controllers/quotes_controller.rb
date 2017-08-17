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

  get '/quotes/:id' do
    if logged_in?
      @quote = Quote.find(params[:id])
      erb :"/quotes/show"
    else
      redirect "/login"
    end
  end

  get '/quotes/:id/edit' do
    if logged_in?
      @quote = Quote.find(params[:id])
      erb :"/quotes/edit"
    else
      redirect "/login"
    end
  end

  patch '/quotes/:id' do
    @quote = Quote.find(params[:id])
    @quote.update(content: params[:content], author: params[:author])
    @quote.save
    redirect "/quotes/#{@quote.id}"
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
