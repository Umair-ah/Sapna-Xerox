class OrdersController < ApplicationController
    before_action :set_order, only: %i[show destroy]

    # GET to /orders/new
    def new
        @order = Order.new
    end

    # POST to /orders
    def create
        @order = Order.new(order_params)

        respond_to do |format|
            if @order.save
                format.html{ redirect_to root_url, success: "Order Succesfully Submitted! You will recieve a call shortly!" }

            else
                format.html{ render :new, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @order.destroy
        respond_to do |format|
            format.html { redirect_to admins_path, info: "Deleted #{@order.id}, #{@order.first_name} #{@order.last_name} Successfully!" }
        end
    end

    def show
    end

    private

        def set_order
            @order = Order.find(params[:id])
        end

        def order_params
            params.require(:order).permit(:first_name, :last_name, :phone_number, :email, :paper_size, :color, :paper_style, :quantity, :description, :location, :delivery, files: [] )
        end
end