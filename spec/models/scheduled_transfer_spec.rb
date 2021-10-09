require 'rails_helper'

RSpec.describe ScheduledTransfer, type: :model do
  context 'Agenda transferencia mensal' do
    let(:transfer) { Fabricate(:scheduled_transfer, scheduled_date: Date.today) }
    let(:wallet) { Fabricate(:wallet, amount_cents: 200_000) }

    it '.next_date_payment' do
      expect(transfer.next_date_payment).to eq(Date.today + 1.month)
    end

    it '.paid' do
      amount_cents_before = wallet.amount_cents
      transfer.paid!(wallet)
      amount_cents_after = amount_cents_before + transfer.amount_cents

      expect(transfer.quantity).to be_nil
      expect(wallet.amount_cents).to eq(amount_cents_after)
      expect(transfer.scheduled_date).to eq(Date.today + 1.month)
    end
  end

  context 'Parcela iphone em 12x' do
    let(:transfer) do
      Fabricate(
        :scheduled_transfer,
        description: 'iphonezada pae',
        amount_cents: 100_000,
        occurrence_type: :debit,

        frequency: :monthly,
        scheduled_date: Date.today,
        quantity: 12
      )
    end

    let(:wallet) { Fabricate(:wallet, amount_cents: 200_000) }

    it '.next_date_payment' do
      amount_cents_before = wallet.amount_cents
      transfer.paid!(wallet)
      amount_cents_after = amount_cents_before - transfer.amount_cents
      expect(transfer.quantity).to eq(11)
      expect(wallet.amount_cents).to eq(amount_cents_after)
      expect(transfer.scheduled_date).to eq(Date.today + 1.month)
    end
  end
end
