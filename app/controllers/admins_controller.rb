class AdminsController < ApplicationController
    before_action :authenticate_admin!
    # GET to
    def index
        # Admin access to the order tables
        @orders = Order.all
    end
end