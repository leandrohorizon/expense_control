require 'rails_helper'

RSpec.describe ScheduledTransfer, type: :model do
  context 'Agenda transferencia mensal' do
    let(:transfer) { Fabricate(:scheduled_transfer, scheduled_date: Date.today) }
    let(:wallet) { Fabricate(:wallet, amount_cents: 200_000) }

    it 'quando é a proxima' do
      expect(transfer.next_payment).to eq(Date.today + 1.month)
    end

    it 'receber' do
      amount_cents_before = wallet.amount_cents
      transfer.paid!(wallet)
      amount_cents_after = amount_cents_before + transfer.amount_cents

      expect(transfer.quantity).to be_nil
      expect(wallet.amount_cents).to eq(amount_cents_after)
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
        scheduled_date: '01/01',
        quantity: 12
      )
    end

    let(:wallet) { Fabricate(:wallet, amount_cents: 200_000) }

    it 'pagar' do
      amount_cents_before = wallet.amount_cents
      transfer.paid!(wallet)
      amount_cents_after = amount_cents_before - transfer.amount_cents
      expect(transfer.quantity).to eq(11)
      expect(wallet.amount_cents).to eq(amount_cents_after)
    end
  end
end
