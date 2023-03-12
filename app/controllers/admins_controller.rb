class AdminsController < ApplicationController
    before_action :authenticate_admin!
    

    def index
        # Admin access to the order tables
        @orders = Order.all.page(params[:page]).per(5)
        @q = Order.ransack(params[:q])
        @orders = @q.result.order(created_at: :desc)
    end

    
end
