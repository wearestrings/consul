module ConsulAssemblies
  class Proposal < ActiveRecord::Base

    belongs_to :meeting
    belongs_to :user

    validates :title, presence: true

    scope :accepted, -> { where(accepted: true) }
    scope :declined, -> { where(accepted: false) }
    scope :pending, -> { where(accepted: nil) }
  end
end
