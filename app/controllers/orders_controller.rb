class OrdersController < ApplicationController
    before_action :set_order, only: %i[show destroy]

    
    def new
        @order = Order.new
        @q = Order.ransack(params[:q])
        @orders = @q.result(distinct: true)
    end

   
    def create
        @order = Order.new(order_params)
        if @order.save && @order.delivery == "Delivery"
            redirect_to new_order_home_path(@order), info: "Enter Your Address For Delivery!"
        elsif @order.save && @order.delivery == "PickUp"
            redirect_to root_path, success: "Your Order Has Been Placed Successfully, You Will Recieve A Call Shortly"
        end
    end

    def destroy
        @order.destroy
        if current_admin
            respond_to do |format|
                format.html { redirect_to admins_path, info: "Deleted #{@order.id}, #{@order.first_name} #{@order.last_name} Successfully!" }
            end
        else
            redirect_to root_path, info: "Order Has Been Cancelled!"
        end



        #respond_to do |format|
        #    format.html { redirect_to admins_path, info: "Deleted #{@order.id}, #{@order.first_name} #{@order.last_name} Successfully!" }
        #end
    end

    def show
    end

    private

        def set_order
            @order = Order.find(params[:id])
        end

        def order_params
            params.require(:order).permit(:first_name, :last_name, :phone_number, :email, :paper_size, :color, :paper_style, :quantity, :description, :delivery, *Order::ROLES, files: [] )
        end
        
end