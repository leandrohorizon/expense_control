class Wallet < ApplicationRecord
  belongs_to :account
  has_many :historic
end
