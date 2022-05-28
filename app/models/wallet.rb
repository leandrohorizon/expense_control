class Wallet < ApplicationRecord
  belongs_to :account
  has_many :historics

  monetize :amount_cents

  def amount
    profit = Money.new(profits.sum(:amount_cents), 'BRL')
    expense = Money.new(expenses.sum(:amount_cents), 'BRL')
    profit - expense
  end

  def profits
    historics.where(occurrence_type: :credit)
  end

  def expenses
    historics.where(occurrence_type: :debit)
  end
end
