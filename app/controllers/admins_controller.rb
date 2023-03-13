class AdminsController < ApplicationController
    before_action :authenticate_admin!
    

    def index
        # Admin access to the order tables
        @q = Order.ransack(params[:q])
        @orders = @q.result.order(created_at: :desc).page(params[:page]).per(5)
    end

    
end
