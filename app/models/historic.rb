class Historic < ApplicationRecord
  belongs_to :wallet

  after_create -> { update_wallet(wallet.amount_cents + value) }
  after_update -> { update_wallet(wallet.amount_cents_before_last_save + value) }
  after_destroy -> { update_wallet(wallet.amount_cents - value) }

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
