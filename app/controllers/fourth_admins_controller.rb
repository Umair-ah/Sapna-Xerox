class FourthAdminsController < ApplicationController
    def index
        @homes = Home.all.order(created_at: :desc)
        @q = Order.ransack(params[:q])
        @orders = @q.result.order(created_at: :desc)
    end

end