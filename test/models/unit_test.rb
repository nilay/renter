# == Schema Information
#
# Table name: units
#
#  id                    :bigint           not null, primary key
#  monthly_rental_amount :decimal(10, 2)
#  sql_meter             :integer
#  status                :integer
#  unit_no               :string(255)      not null
#  year_built            :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  unit_type_id          :bigint           not null
#
# Indexes
#
#  index_units_on_status        (status)
#  index_units_on_unit_no       (unit_no) UNIQUE
#  index_units_on_unit_type_id  (unit_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (unit_type_id => unit_types.id)
#
require "test_helper"

class UnitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
