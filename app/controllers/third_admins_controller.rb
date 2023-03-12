class ThirdAdminsController < ApplicationController
    before_action :authenticate_admin!
    def index
        @picks = Pick.where(shop:"Sapna Xerox Near Timmapuri").order(created_at: :desc).page(params[:page]).per(5)
        @q = Order.ransack(params[:q])
        @orders = @q.result.order(created_at: :desc)

    end

end