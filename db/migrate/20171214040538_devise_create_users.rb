class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change    
    create_table :contact_preferences do |t| 
      t.string :preference
    end

    create_table :car_years do |t| 
      t.string :year
    end

    create_table :car_makes do |t| 
      t.references :car_year, index: true, foreign_key: true
      t.string :name
    end

    create_table :car_models do |t| 
      t.references :car_make, index: true, foreign_key: true
      t.string :name
    end

    create_table :car_trims do |t| 
      t.references :car_model, index: true, foreign_key: true
      t.string :trim
    end

    create_table :car_colors do |t| 
      t.references :car_trim, index: true, foreign_key: true
      t.string :exterior_color
      t.string :interior_color
    end

    create_table :dealerships do |t| 
      t.string :name
      t.references :car_make, index: true, foreign_key: true
      t.string :address
    end   

    create_table :users do |t|
      ## Database authenticatable
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :image
      t.string :credit_score
      t.references :dealership, index: true, foreign_key: true
      t.references :contact_preference, index: true, foreign_key: true

      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      t.datetime :deleted_at


      t.timestamps null: false
    end

    create_table :purchase_options do |t| 
      t.string :option
    end

    create_table :car_qualities do |t| 
      t.string :quality
    end

    create_table :proposals do |t| 
      t.references :user, index: true, foreign_key: true
      t.references :purchase_option, index: true, foreign_key: true
      t.references :car_quality, index: true, foreign_key: true
      t.references :car_year, index: true, foreign_key: true
      t.references :car_make, index: true, foreign_key: true
      t.references :car_model, index: true, foreign_key: true
      t.references :car_trim, index: true, foreign_key: true
      t.references :car_color, index: true, foreign_key: true
      t.text :add_ons
      t.integer :price
      t.integer :over_under_price
      t.integer :down_payment
      t.integer :lease_length
      t.integer :mileage_limit
      t.integer :closing_cost
      t.boolean :financing
      t.float :apr
      t.datetime :deadline
    end

    create_table :responses do |t| 
      t.references :user, index: true, foreign_key: true
      t.references :proposal, index: true, foreign_key: true
      t.references :car_year, index: true, foreign_key: true
      t.references :car_model, index: true, foreign_key: true
      t.references :car_trim, index: true, foreign_key: true
      t.references :car_color, index: true, foreign_key: true
      t.text :add_ons
      t.integer :price
      t.integer :down_payment
      t.integer :lease_length
      t.integer :mileage_limit
      t.integer :closing_cost
      t.boolean :financing
      t.float :apr
      t.datetime :deadline
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true
  end
end
