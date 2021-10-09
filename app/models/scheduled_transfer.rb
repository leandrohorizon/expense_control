class ScheduledTransfer < ApplicationRecord
  has_many :historic

  enum occurrence_type: %w[credit debit]
  enum frequency: %w[unique daily weekly monthly yearly forever]
end
