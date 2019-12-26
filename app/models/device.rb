# == Schema Information
#
# Table name: devices
#
#  id          :bigint           not null, primary key
#  mac_address :string
#  name        :string           not null
#  read_key    :string
#  uuid        :uuid             not null
#  write_key   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Device < ApplicationRecord
  has_many :readings
  validates_uniqueness_of(:write_key)
  validates_uniqueness_of(:read_key)

  def generate_write_key
    self.write_key = loop do
      random_key = SecureRandom.base58(16) #16 digits
      break random_key unless Device.exists?(write_key: random_key)
    end
  end

  def generate_read_key
    self.read_key = loop do
      random_key = SecureRandom.base58(16) #16 digits
      break random_key unless Device.exists?(read_key: random_key)
    end
  end
end
