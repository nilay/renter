# == Schema Information
#
# Table name: appointments
#
#  id             :bigint           not null, primary key
#  datetime       :datetime
#  interest_level :integer
#  note           :text(65535)
#  status         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  unit_id        :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_appointments_on_unit_id  (unit_id)
#  index_appointments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (unit_id => units.id)
#  fk_rails_...  (user_id => users.id)
#
class Appointment < ApplicationRecord
  extend Enumerize

  belongs_to :unit
  belongs_to :user

  enumerize :status, in: {
    upcoming: 1,
    expired: 2,
    attended: 3
  }, default: :upcoming, scope: true

  enumerize :interest_level, in: {
    high: 1,
    medium: 2,
    low: 3
  }, default: :medium, scope: true

end
