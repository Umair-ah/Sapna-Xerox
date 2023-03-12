class ThirdAdminsController < ApplicationController
    def index
        @picks = Pick.where(shop:"Sapna Xerox Near Timmapuri").order(created_at: :desc)
        @q = Order.ransack(params[:q])
        @orders = @q.result.order(created_at: :desc)

    end

end