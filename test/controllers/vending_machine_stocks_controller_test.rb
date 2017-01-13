require 'test_helper'

class VendingMachineStocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vending_machine_stock = vending_machine_stocks(:one)
  end

  test "should get index" do
    get vending_machine_stocks_url
    assert_response :success
  end

  test "should get new" do
    get new_vending_machine_stock_url
    assert_response :success
  end

  test "should create vending_machine_stock" do
    assert_difference('VendingMachineStock.count') do
      post vending_machine_stocks_url, params: { vending_machine_stock: { product_id: @vending_machine_stock.product_id, quantity: @vending_machine_stock.quantity, vendingmachine_id: @vending_machine_stock.vendingmachine_id } }
    end

    assert_redirected_to vending_machine_stock_url(VendingMachineStock.last)
  end

  test "should show vending_machine_stock" do
    get vending_machine_stock_url(@vending_machine_stock)
    assert_response :success
  end

  test "should get edit" do
    get edit_vending_machine_stock_url(@vending_machine_stock)
    assert_response :success
  end

  test "should update vending_machine_stock" do
    patch vending_machine_stock_url(@vending_machine_stock), params: { vending_machine_stock: { product_id: @vending_machine_stock.product_id, quantity: @vending_machine_stock.quantity, vendingmachine_id: @vending_machine_stock.vendingmachine_id } }
    assert_redirected_to vending_machine_stock_url(@vending_machine_stock)
  end

  test "should destroy vending_machine_stock" do
    assert_difference('VendingMachineStock.count', -1) do
      delete vending_machine_stock_url(@vending_machine_stock)
    end

    assert_redirected_to vending_machine_stocks_url
  end
end
