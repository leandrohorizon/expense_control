class Historic < ApplicationRecord
  belongs_to :wallet

  enum occurrence_type: %w[credit debit]

  monetize :amount_cents

  private

  def value
    return amount_cents * -1 if debit?

    amount_cents
  end

  def update_wallet(amount_cents)
    wallet.update(amount_cents: amount_cents)
  end
end
