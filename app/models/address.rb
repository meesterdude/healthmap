# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  entry      :string
#  latitude   :string
#  longitude  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Address < ApplicationRecord
  geocoded_by :entry
  before_validation :geocode
  validates :latitude, :longitude, presence: true

  def color
    color_range = ('0'..'9').to_a + ('a'..'f').to_a
    "#" + 6.times.collect{color_range.sample}.join('')
  end
end
