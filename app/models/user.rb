class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :image, ImageUploader
  acts_as_paranoid

  belongs_to :dealership, optional: true
  has_many :proposals
  has_many :responses
  has_many :reviews, :class_name => 'Review', :foreign_key => 'seller_id'
  has_many :reviews, :class_name => 'Review', :foreign_key => 'buyer_id'
  has_many :notifications, as: :recipient

  after_commit -> { NotificationRelayJob.perform_later(self) }
  
  def self.assign_from_row(row)
    user = User.where(email: row[:email]).first_or_initialize
    user.assign_attributes row.to_hash.slice(:email, :password, :password_confirmation, :first_name, :last_name, :image, :phone_number, :credit_score, :dealership_id, :contact_preference_type_id)
  end

  def name
    if deleted_at?
      "Deleted User"
    else
      "#{first_name} #{last_name}"
    end
  end
end
