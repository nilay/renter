# frozen_string_literal: true

# == Schema Information
#
# Table name: unit_types
#
#  id          :bigint           not null, primary key
#  description :text(65535)
#  name        :string(255)      not null
#  unit_count  :integer          default(0)
#  use_type    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_unit_types_on_name  (name) UNIQUE
#
class UnitType < ApplicationRecord
  has_many :units

  validates :name, presence: true, uniqueness: true
end
