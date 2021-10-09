# frozen_string_literal: true

class ScheduledTransfer < ApplicationRecord
  has_many :historic

  enum occurrence_type: %w[credit debit]
  enum frequency: %w[unique daily weekly monthly yearly]

  def next_payment
    return false if unique?

    case frequency
    when 'daily' then scheduled_date + 1.day
    when 'weekly' then puts scheduled_date + 7.day
    when 'monthly' then scheduled_date + 1.month
    when 'yearly' then scheduled_date + 1.year
    else
      raise 'invalid frequency'
    end
  end

  def paid!(wallet, adjustment = 0)
    return if quantity&.zero?

    decrement!(:quantity) unless quantity.nil?

    historic.create(description: description,
                    amount_cents: amount_cents + adjustment,
                    occurrence_type: occurrence_type,
                    wallet: wallet)
  end
end
