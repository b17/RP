ONE_KM = 1000

module GeoHelper
  def self.to_rads(angle)
      angle.to_f/180 * Math::PI
  end

  def self.to_meters(km)
    km*ONE_KM
  end
end
