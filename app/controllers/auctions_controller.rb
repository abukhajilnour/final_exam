class AuctionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,:edit]
  # load_and_authorize_resource
  # skip_authorize_resource :only => [:show, :index, :new, :create]
  before_action :find_and_authorize_auction, only: [:edit, :update, :destroy]

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    if @auction.save
      redirect_to @auction, notice: "success"
    else
      render :new
    end
  end

 def index
    @auctions = Auction.all.order('created_at DESC')
    respond_to do |format|
      format.html { render :index }
      format.js   { render :index }
    end
  end

  def show
    @auction = Auction.find(params[:id])
    @pledge= Pledge.new
    respond_to do |format|
      format.html { render :show }
      format.js { render :show }
    end
  end

  def edit
  end

   def update
    if @auction.update_attributes auction_params
      redirect_to @auction, notice: "Auction Updated!"
    else
      render :edit
    end
  end


  def destroy
    @auction.destroy
    redirect_to auctions_path, notice: "Auction deleted"
  end


  private

   def find_and_authorize_auction
    @auction = Auction.find params[:id]
  end

  def auction_params
    params.require(:auction).permit(:title, :details, :reserve_price, :ending_date)
  end

end
