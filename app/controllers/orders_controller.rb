class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [ :veritrans_webhook ]

  def create
    order = Order.create!(status: "pending", payment_method: params[:payment_method])

    params[:order_items].each do |item|
      menu = Menu.find(item[:menu_id])
      order.order_items.create!(
        menu: menu,
        quantity: item[:quantity].to_i,
        price: menu.price * item[:quantity].to_i
      )
    end

    order.update(total_price: order.order_items.sum(:price))

    payment_response = VeritransService.new(order).create_transaction

    if payment_response["status_code"] == "201"
      order.update(transaction_id: payment_response["transaction_id"], status: payment_response["transaction_status"])
      redirect_to order_path(order), notice: "Silakan lakukan pembayaran."
    else
      redirect_to new_order_path, alert: "Gagal membuat transaksi."
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def veritrans_webhook
    json_params = JSON.parse(request.body.read)
    order = Order.find_by(transaction_id: json_params["transaction_id"])

    if order
      order.update(status: json_params["transaction_status"])
      render json: { message: "Status pembayaran diperbarui" }, status: :ok
    else
      render json: { error: "Order tidak ditemukan" }, status: :not_found
    end
  end
end
