class DeviseCreateUsers < ActiveRecord::Migration[5.1]
def change    
    create_table :dealerships do |t| 
      t.string :name
      t.string :address
      t.string :make
    end     

    create_table :contact_preference_types do |t| 
      t.string :type
    end

    create_table :users do |t|
      ## Database authenticatable
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :image
      t.string :credit_score
      t.references :dealership, index: true, foreign_key: true
      t.references :contact_preference_type, index: true, foreign_key: true

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

    create_table :purchase_types do |t| 
      t.string :type
    end

    create_table :car_quality_types do |t| 
      t.string :type
    end

    create_table :proposals do |t| 
      t.references :user, index: true, foreign_key: true
      t.references :purchase_type, index: true, foreign_key: true
      t.references :car_quality_type, index: true, foreign_key: true
      t.string :make
      t.string :model
      t.integer :year
      t.string :exterior_color, array: true, default: []
      t.string :interior_color, array: true, default: []
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
      t.integer :year
      t.string :exterior_color
      t.string :interior_color
      t.integer :price
      t.integer :down_payment
      t.integer :lease_length
      t.integer :mileage_limit
      t.integer :closing_cost
      t.boolean :financing
      t.float :apr
      t.datetime :deadline
      t.text :add_ons
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true
  end
end
