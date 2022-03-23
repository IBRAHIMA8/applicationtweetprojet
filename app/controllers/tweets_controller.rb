class TweetsController < ApplicationController
before_action :set_tweet, only: [:show, :edit, :update, :destroy]




  def index
      @tweets = Tweet.all.order(id: "desc")
  end


  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if params[:back]
      render :new
    else
      if @tweet.save
        redirect_to tweets_path, notice: "Vous avez créé un nouveau Tweet !"
      else
        render :new
      end
    end
  end


  def show
  #@tweet= Tweet.find(params[:id])
  end


  def edit
  #@tweet= Tweet.find(params[:id])
  end



  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "Votre Tweet est modifié !"
    else
      render :edit
    end
  end


  def destroy
         @tweet.destroy
         redirect_to tweets_path, notice:"Vous avez supprimé un Tweet！"
     end


     def confirm
          @tweet = Tweet.new(tweet_params)
        end


     def confirm
         @tweet= Tweet.new(tweet_params)
        render :new if @tweet.invalid?
     end

     private

     def tweet_params
       params.require(:tweet).permit(:content)
     end

   def set_tweet
     @tweet = Tweet.find(params[:id])
   end


end
