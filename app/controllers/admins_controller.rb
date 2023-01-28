class AdminsController < ApplicationController
    before_action :authenticate_admin!
    

    # GET to
    def index
        # Admin access to the order tables
        @orders = Order.all.order(created_at: :desc)
        @q = Order.ransack(params[:q])
        @orders = @q.result.order(created_at: :desc)
    end

    
end
