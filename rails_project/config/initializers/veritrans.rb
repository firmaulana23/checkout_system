Rails.application.config.veritrans = {
  environment: Rails.env.production? ? 'production' : 'sandbox',
  server_key: ENV['VERITRANS_SERVER_KEY'],
  client_key: ENV['VERITRANS_CLIENT_KEY'],
  payment_methods: {
    credit_card: true,
    bank_transfer: true,
    e_wallet: true
  }
}