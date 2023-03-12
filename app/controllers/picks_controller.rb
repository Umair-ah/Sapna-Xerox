class PicksController < ApplicationController
    before_action :set_order

    def new
        @pick = @order.picks.build
    end

    def create
        @pick = @order.picks.build(pick_params)
        if @pick.save
            redirect_to root_path, success: "Your Order Has Been Successfully Placed, You Will Recieve A Call Shortly!"
        end
    end



    private

        def set_order
            @order = Order.find(params[:order_id])
        end

        def set_pick
            @pick = Pick.find(params[:id])
        end

        def pick_params
            params.require(:pick).permit(:order_id, :shop)
        end
end
