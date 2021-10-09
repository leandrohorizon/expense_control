class Wallet < ApplicationRecord
  belongs_to :account
  has_many :historic

  monetize :amount_cents
end
