class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show ]

  def index
    if params[:sku].present?
      @products = Product.where(sku: params[:sku])
    elsif params[:top_sold].present? && params[:top_sold] == "true"
      @products = Product.order(sold: :desc).limit(params[:limit] || 10)
    else
      @products = Product.all
    end

    render json: @products
  end

  def show
    render json: @product
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :sku, :price, :currency, :active, :category_id)
    end
end
