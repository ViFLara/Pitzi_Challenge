class Api::V1::OrdersController < ApplicationController
   
    # GET /orders    
    def index
        @orders= Order.all
    end

    # GET /api/v1/orders/:id
    def show
        order = Order.find_by(id: params[:id])
        if order
            render json: order, status: 200
        else
            render json: {error: "Assinatura não foi localizada."}
        end
    end

    # POST /api/v1/orders
    def create
        @order = Order.new(order_params)
        if @order.save
            render json: @order, status: 200
        else
            render json: @order.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /api/v1/orders/1
    #falta finalizar implementação
    def update
        if @order.update(order_params)
            render json: @order
        else
            render json: @order.errors, status: :unprocessable_entity
        end
    end

    # DELETE /api/v1/orders/1
    #falta finalizar implementação
    def destroy
        Order.find(params[:id]).destroy!
        head :no_content  
    end
    

    private    
    def order_params
        params.permit(:device_model, :device_IMEI, :year_price, :number_plots)
    end
    
    def set_user
        @user = User.find(params[:user_id])
    end
    
    def set_user_order
        @order = @user.orders.find_by!(id: params[:id]) if @user
    end

end
