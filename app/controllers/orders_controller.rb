class OrdersController < ApplicationController
    before_action :set_order, only: %i[show destroy]
    include ActiveStorage::SendZip



    def download_files
        @order = Order.find(params[:id])
        send_zip @order.files, filename: "#{@order.first_name + @order.last_name + @order.id.to_s}.zip"
    end
    
    def new
        @order = Order.new
    end

   
    def create
        @order = Order.new(order_params)
        if @order.save && @order.delivery == "Delivery"
            redirect_to new_order_home_path(@order), info: "Enter Your Address For Delivery!"
        elsif @order.save && @order.delivery == "PickUp"
            redirect_to new_order_pick_path(@order), info: "Select Your Shop For PickUp!"
        end
    end

    def destroy
        @order.destroy
        if current_admin
            respond_to do |format|
                format.html { redirect_to admins_path, info: "Deleted #{@order.id}, #{@order.first_name} #{@order.last_name} Successfully!" }
            end
        else
            redirect_to root_path, danger: "Order Has Been Cancelled!"
        end



        #respond_to do |format|
        #    format.html { redirect_to admins_path, info: "Deleted #{@order.id}, #{@order.first_name} #{@order.last_name} Successfully!" }
        #end
    end

    def delete_all
        Home.delete_all
        Order.delete_all
        redirect_to admins_path, warning: "All Orders Deleted!"
    end

    def show
    end

    private

        def set_order
            @order = Order.find(params[:id])
        end

        def order_params
            params.require(:order).permit(:first_name, :last_name, :phone_number, :email, :paper_size, :color, :paper_style, :quantity, :description, :delivery, *Order::ROLES, files: [] )
        end
        
end