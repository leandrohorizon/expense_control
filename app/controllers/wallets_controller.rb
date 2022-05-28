class WalletsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_wallet, only: %i[show edit update destroy]

  def index
    @wallets = current_account.wallets.all
  end

  def show
    @historics = @wallet.historics
  end

  def new
    @wallet = current_account.wallets.new
  end

  def create
    @wallet = current_account.wallets.new(wallet_params)
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
      render :edit
    end
  end

  def destroy
    if @wallet.destroy
      render :index
    else
      render :show
    end
  end

  private

  def wallet_params
    params
      .require(:wallet)
      .permit(:source, :amount)
  end

  def set_wallet
    @wallet = current_account.wallets.find(params[:id])
  end
end
