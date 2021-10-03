require 'rails_helper'

RSpec.describe Wallet, type: :model do
  context 'Cria historico dos cria' do
    let(:wallet) { Fabricate(:wallet) { amount_cents 5000 } }

    it 'debita o valor da carteira' do
      amount_cents_before = wallet.amount_cents

      historic = Fabricate(:historic,
                           wallet: wallet)

      amount_cents_after = amount_cents_before - historic.amount_cents
      expect(wallet.amount_cents).to eq(amount_cents_after)
    end
  end

  context 'atualiza o valor da carteira' do
    let(:historic) do
      Fabricate(:historic)
    end

    it 'atualiza o valor do historico' do
      historic.update(amount_cents: 500)
      wallet = historic.wallet

      expect(wallet.amount_cents).to eq(500)
    end

    it 'apaga o historico' do
      historic.destroy
      wallet = historic.wallet

      expect(wallet.amount_cents).to eq(1000)
    end
  end
end
