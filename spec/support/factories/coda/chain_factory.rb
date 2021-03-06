FactoryBot.define do
  factory :coda_chain, class: 'Coda::Chain' do
    name     { 'Mainnet' }
    slug     { 'coda' }
    api_url  { 'http://localhost:8081' }
    testnet  { false }
    disabled { false }
    primary  { true }

    token_map do
      { "coda": { "factor": 9, "display": 'CODA', "primary": true } }
    end
  end
end
