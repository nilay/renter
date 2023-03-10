# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  address                :string(255)
#  city                   :string(255)
#  email                  :string(255)      not null
#  encrypted_password     :string(255)      not null
#  first_name             :string(255)      not null
#  last_name              :string(255)      not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  role                   :integer          not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend Enumerize

  enumerize :role, in: {
    manager: 1,
    receptionist: 2,
    renter: 3
  }, scope: true

  has_one :appointment
  accepts_nested_attributes_for :appointment


  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
