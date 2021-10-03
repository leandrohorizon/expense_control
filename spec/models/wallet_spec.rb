require 'rails_helper'

RSpec.describe Wallet, type: :model do
  context 'Cria carteira dos cria' do
    let(:account) { Fabricate(:account) }

    it 'com parâmetros válidos' do
      wallet = Wallet.new(source: 'banco friba',
                          amount_cents: 1000,
                          account: account)

      expect(wallet).to be_valid
    end
  end
end
