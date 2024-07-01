require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url, as: :json
    assert_response :success
  end

  test "should get index and retrieve matching SKU if set as param" do
    get products_url(sku: 'PRODUCTSKU1'), as: :json
    product = [ProductSerializer.new(@product)].to_json

    assert_response :success
    assert_equal response.body, product
  end

  test "should get index and retrieve top sold according to limit" do
    get products_url(top_sold: 'true', limit: 1), as: :json
    product = [ProductSerializer.new(products(:two))].to_json

    assert_response :success
    assert_equal response.body, product
  end

  test "should show product" do
    get product_url(@product), as: :json
    assert_response :success
  end
  
end
