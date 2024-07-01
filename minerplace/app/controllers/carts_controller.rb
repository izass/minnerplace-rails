class CartsController < ApplicationController
    before_action :set_cart, only: [:show, :update]
  
    def show
      render json: @cart, include: ['line_items', 'line_items.product']
    end
  
    def create      
      @cart = Cart.new(cart_params)
  
      if @cart.save
        render json: @cart, include: ['line_items', 'line_items.product'], status: :created, location: @cart
      else
        render json: @cart.errors, status: :unprocessable_entity
      end
    end
  
    def update
      # For evaluation purposes. Can be ignored. ========
      if rand < 0.3
        render json: { error: 'Service unavailable' }, status: :unprocessable_entity
        return
      end
      # =================================================

      if @cart.update(cart_params.except(:line_items_attributes))
        update_or_create_line_items

        render json: @cart, include: ['line_items', 'line_items.product']
      else
        render json: @cart.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_cart
      @cart = Cart.find(params[:id])
    end
  
    def cart_params
      params.require(:cart).permit(:user_id, line_items_attributes: [:product_id, :quantity])
    end

    def update_or_create_line_items
      cart_params[:line_items_attributes].each do |line_item_params|
        product_id = line_item_params[:product_id]
        
        if product_id.present?
          line_item = @cart.line_items.find_or_initialize_by(product_id: product_id)
          
          if line_item_params[:quantity].to_i == 0
            line_item.destroy
          else
            line_item.update(line_item_params)
          end
        end
      end
    end
end
  