module Availability
  extend ActiveSupport::Concern

  included do
    scope :available, -> { where(post_status: 1)}
    scope :unavailable, -> { where(post_status: 2)}
  end
end
