class ApplicationController < ActionController::Base
    add_flash_types :danger, :info, :warning, :success
    before_action :set_query

    def set_query
        @query = Order.ransack(params[:q])
    end
end
