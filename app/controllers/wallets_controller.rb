class WalletsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_wallet, only: %i[show edit update destroy]

  def index
    @wallets = current_account.wallet.all
  end

  def show
    @historics = @wallet.historic
  end

  def new
    @wallet = current_account.wallet.new
  end

  def create
    @wallet = current_account.wallet.new(wallet_params)
    if @wallet.save
      redirect_to @wallet
    else
      render :new
    end
  end

  def edit; end

  def update
    if @wallet.update(wallet_params)
      redirect_to @wallet
    else
      render :new
    end
  end

  private

  def wallet_params
    params
      .require(:wallet)
      .permit(:source, :amount)
  end

  def set_wallet
    @wallet = current_account.wallet.find(params[:id])
  end
end