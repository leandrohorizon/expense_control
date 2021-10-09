class ScheduledTransfer < ApplicationRecord
  enum occurrence_type: %w[credit debit]
  enum frequency: %w[unique daily monthly yearly]
end
