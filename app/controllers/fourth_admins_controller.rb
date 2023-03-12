class FourthAdminsController < ApplicationController
    before_action :authenticate_admin!
    def index
        @homes = Home.all.order(created_at: :desc).page(params[:page]).per(5)
        @q = Order.ransack(params[:q])
        @orders = @q.result.order(created_at: :desc)
    end

end