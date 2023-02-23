# == Schema Information
#
# Table name: leases
#
#  id           :bigint           not null, primary key
#  from_date    :date             not null
#  status       :integer
#  to_date      :date             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  leased_by_id :bigint
#  renter_id    :bigint
#  unit_id      :bigint           not null
#
# Indexes
#
#  index_leases_on_leased_by_id  (leased_by_id)
#  index_leases_on_renter_id     (renter_id)
#  index_leases_on_status        (status)
#  index_leases_on_unit_id       (unit_id)
#
# Foreign Keys
#
#  fk_rails_...  (leased_by_id => users.id)
#  fk_rails_...  (renter_id => users.id)
#  fk_rails_...  (unit_id => units.id)
#
require "test_helper"

class LeaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
