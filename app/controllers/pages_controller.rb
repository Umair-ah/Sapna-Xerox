class PagesController < ApplicationController

    # Home Page
    def home
        @q = Order.ransack(params[:q])
        @orders = @q.result(distinct: true)
    end

    # About Page
    def about
        @q = Order.ransack(params[:q])
        @orders = @q.result(distinct: true)
    end

end