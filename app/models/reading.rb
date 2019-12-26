# == Schema Information
#
# Table name: readings
#
#  id         :bigint           not null, primary key
#  data       :jsonb
#  datetime   :datetime
#  uuid       :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  device_id  :bigint
#
# Indexes
#
#  index_readings_on_device_id  (device_id)
#
# Foreign Keys
#
#  fk_rails_...  (device_id => devices.id)
#

class Reading < ApplicationRecord
  belongs_to :device
end
