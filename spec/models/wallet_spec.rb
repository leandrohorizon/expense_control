require 'rails_helper'

RSpec.describe Wallet, type: :model do
  context 'Cria carteira dos cria' do
    let(:wallet) { Fabricate(:wallet) }

    it 'com parâmetros válidos' do
      expect(wallet).to be_valid
      expect(Wallet.last).to eq(wallet)
    end
  end
end
