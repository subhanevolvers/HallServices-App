# frozen_string_literal: true

class User < ActiveRecord::Base
  ATTRIBUTES_WHITELIST = [
    :id,
    :email,
    :first_name,
    :last_name,
    :image,
    :password,
    :phone_number,
    :cnic,
    :address,
    :profile_photo
  ].freeze

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend Devise::Models
  include DeviseTokenAuth::Concerns::User

  has_one_attached :profile_photo , dependent: :destroy

  validates :email , presence: true , uniqueness: true , format: { with: Devise.email_regexp }
  validates :first_name , :last_name , presence:true
  before_validation :strip_and_ensure_uid

  private

  def strip_and_ensure_uid

    self.first_name.strip! if self.first_name.present?
    self.last_name.strip! if self.last_name.present?
    self.uid = email if email.present

  end

end
