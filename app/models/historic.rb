class Historic < ApplicationRecord
  belongs_to :wallet

  enum occurrence_type: %w[credit debit]

  monetize :amount_cents

  private

  def value
    return -amount_cents if debit?

    amount_cents
  end
end
