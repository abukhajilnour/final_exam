class BidsController < ApplicationController
    before_action :authenticate_user!, except: :index
    before_action :find_auction

  def index
    @pledges = @auction.pledges
  end

  def create
    @pledge = @auction.pledges.new pledge_params
    @pledge.user = current_user
    if @pledge.save
      redirect_to new_pledge_order_path(@pledge), notice: "Please complete your pledeg"
    else
      render "auctions/show"
    end
  end

  def show
    @auction=@pledge.auction
  end

  private

  def pledge_params
    params.require(:pledge).permit(:bid)
  end

  def find_auction
    @auction = Auction.find params[:auction_id]
  end

end
