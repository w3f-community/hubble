require 'rails_helper'

describe Polkadot::BlocksController do
  describe 'GET #show' do
    subject { get :show, params: params }

    let(:params) do
      { network: chain.network_name.downcase, chain_id: chain.slug, id: '123', format: :json }
    end
    let(:chain) { create(:polkadot_chain) }
    let(:client) { double(block: block, status: status, validators: [{ validator: 'validator data' }]) }
    let(:block) { double(height: 10, transactions: [{ transaction: 'transaction data' }]) }
    let(:status) { double(last_indexed_height: 200, last_indexed_session_height: 200, indexed_validators_height: 200) }

    context 'json format' do
      it 'returns a json response' do
        expect(Polkadot::Client).to receive(:new).and_return(client)
        subject
        keys = JSON.parse(response.body).keys
        expect(keys).to include('block')
        expect(keys).to include('transactions')
        expect(keys).to include('validators')
      end
    end
  end
end
