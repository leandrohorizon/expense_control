class Wallet < ApplicationRecord
  belongs_to :account
  has_many :historics

  monetize :amount_cents
end
