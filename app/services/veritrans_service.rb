require "net/http"
require "json"

class VeritransService
  def initialize(order)
    @order = order
    @server_key = ENV["MIDTRANS_SERVER_KEY"]
    @api_url = ENV["MIDTRANS_API_URL"]
  end

  def create_transaction
    uri = URI("#{@api_url}/charge")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.path, {
      "Content-Type" => "application/json",
      "Authorization" => "Basic #{Base64.strict_encode64(@server_key + ':')}"
    })

    request.body = {
      transaction_details: {
        order_id: @order.id,
        gross_amount: @order.total_price
      },
      item_details: @order.order_items.map do |item|
        {
          id: item.menu.id,
          price: item.menu.price,
          quantity: item.quantity,
          name: item.menu.name
        }
      end,
      payment_type: "bank_transfer", # atau 'qris' untuk Dana
      customer_details: {
        email: "customer@example.com"
      }
    }.to_json

    response = http.request(request)
    JSON.parse(response.body)
  end
end
