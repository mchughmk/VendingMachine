class VendingMachineStocksController < ApplicationController
  before_action :set_vending_machine_stock, only: [:show, :edit, :update, :destroy]

  # GET /vending_machine_stocks
  # GET /vending_machine_stocks.json
  def index
    @vending_machine_stocks = VendingMachineStock.all
  end

  # GET /vending_machine_stocks/1
  # GET /vending_machine_stocks/1.json
  def show
  end

  # GET /vending_machine_stocks/new
  def new
    @vending_machine_stock = VendingMachineStock.new
  end

  # GET /vending_machine_stocks/1/edit
  def edit
  end

  # POST /vending_machine_stocks
  # POST /vending_machine_stocks.json
  def create
    @vending_machine_stock = VendingMachineStock.new(vending_machine_stock_params)

    respond_to do |format|
      if @vending_machine_stock.save
        format.html { redirect_to @vending_machine_stock, notice: 'Vending machine stock was successfully created.' }
        format.json { render :show, status: :created, location: @vending_machine_stock }
      else
        format.html { render :new }
        format.json { render json: @vending_machine_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vending_machine_stocks/1
  # PATCH/PUT /vending_machine_stocks/1.json
  def update
    respond_to do |format|
      if @vending_machine_stock.update(vending_machine_stock_params)
        format.html { redirect_to @vending_machine_stock, notice: 'Vending machine stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @vending_machine_stock }
      else
        format.html { render :edit }
        format.json { render json: @vending_machine_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vending_machine_stocks/1
  # DELETE /vending_machine_stocks/1.json
  def destroy
    @vending_machine_stock.destroy
    respond_to do |format|
      format.html { redirect_to vending_machine_stocks_url, notice: 'Vending machine stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vending_machine_stock
      @vending_machine_stock = VendingMachineStock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vending_machine_stock_params
      params.require(:vending_machine_stock).permit(:vending_machine_id, :product_id, :quantity)
    end
end
