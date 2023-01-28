class HomesController < ApplicationController
    before_action :set_order

    def new
        @home = @order.homes.build
    end

    def create
        @home = @order.homes.build(home_params)
        if @home.save
            redirect_to root_path, success: "Your Order Has Been Successfully Placed, You Will Recieve A Call Shortly!"
        end
    end



    private

        def set_order
            @order = Order.find(params[:order_id])
        end

        def set_home
            @home = Home.find(params[:id])
        end

        def home_params
            params.require(:home).permit(:order_id, :address)
        end
end