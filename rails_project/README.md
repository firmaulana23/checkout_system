# Rails Project Documentation

## Overview

This Rails project is designed to provide an admin dashboard and a client dashboard. The client dashboard allows users to browse a menu, place orders, and make payments using the Veritrans payment gateway.

## Features

- **Admin Dashboard**: Manage and oversee the application functionalities.
- **Client Dashboard**: Users can view the menu, create orders, and process payments.
- **Order Management**: Clients can create and list their orders.
- **Payment Processing**: Integration with Veritrans for secure payment transactions.

## Directory Structure

- `app/controllers`: Contains the controllers for handling requests.
  - `admin/dashboard_controller.rb`: Admin dashboard functionalities.
  - `client/dashboard_controller.rb`: Client dashboard functionalities.
  - `client/orders_controller.rb`: Order management for clients.
  - `payments_controller.rb`: Payment processing functionalities.

- `app/models`: Contains the models representing the data structure.
  - `order.rb`: Represents the order model with validations and associations.
  - `user.rb`: Represents the user model with validations and associations.

- `app/views`: Contains the views for rendering HTML.
  - `admin/dashboard/index.html.erb`: Admin dashboard index view.
  - `client/dashboard/index.html.erb`: Client dashboard index view.
  - `client/orders/index.html.erb`: View for listing client orders.
  - `client/orders/new.html.erb`: View for creating a new order.
  - `payments/new.html.erb`: View for processing a new payment.

- `app/assets/stylesheets`: Contains stylesheets for the application.
  - `admin.scss`: Styles specific to the admin dashboard.
  - `client.scss`: Styles specific to the client dashboard.

- `app/assets/javascripts`: Contains JavaScript files for the application.
  - `admin.js`: JavaScript specific to the admin dashboard.
  - `client.js`: JavaScript specific to the client dashboard.

- `config`: Contains configuration files.
  - `routes.rb`: Defines the application routes.
  - `initializers/veritrans.rb`: Initializes Veritrans payment gateway configuration.

- `db/migrate`: Contains migration files for database schema changes.
  - `20231010123456_create_users.rb`: Migration for creating users table.
  - `20231010123457_create_orders.rb`: Migration for creating orders table.
  - `20231010123458_add_payment_status_to_orders.rb`: Migration for adding payment status to orders.

- `db/schema.rb`: Reflects the current database schema.

- `Gemfile`: Lists the gems required for the project.

## Getting Started

1. Clone the repository.
2. Run `bundle install` to install the required gems.
3. Set up the database with `rails db:create` and `rails db:migrate`.
4. Start the server with `rails server`.
5. Access the application at `http://localhost:3000`.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any enhancements or bug fixes.

## License

This project is licensed under the MIT License. See the LICENSE file for details.