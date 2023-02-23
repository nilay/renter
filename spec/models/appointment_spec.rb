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
require 'rails_helper'

RSpec.describe Appointment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
