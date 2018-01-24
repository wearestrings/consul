module ConsulAssemblies
  class Assembly < ActiveRecord::Base

    has_many :meetings
    belongs_to :geozone

    validates :name, presence: true
    validates :geozone, presence: true
  end
end
