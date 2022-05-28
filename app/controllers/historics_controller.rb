class HistoricsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_historic, only: %i[show edit update destroy]

  def index
    @historics = current_account.historic_transfers
  end

  def show; end

  def new
    @historic = Historic.new
  end

  def create
    @historic = Historic.new(historic_params)
    if @historic.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit; end

  def update
    if @historic.update(historic_params)
      redirect_to @historic
    else
      render :edit
    end
  end

  def destroy
    if @historic.destroy
      redirect_to action: :index
    else
      render :show
    end
  end

  private

  def historic_params
    params
      .require(:historic)
      .permit(:description, :amount, :occurrence_type, :created_at, :wallet_id)
  end

  def set_historic
    @historic = Historic.find(params[:id])
  end
end
