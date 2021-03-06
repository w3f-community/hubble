Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w[
  admin.js admin.scss
  errors.scss
  account.js account.scss
  cosmoslike.js cosmoslike.scss
  oasis.js oasis.scss
  livepeer.js livepeer.scss
  tezos.js tezos.scss
  near.js near.scss
  polkadot.js polkadot.scss
  coda.js coda.scss
  redesign/celo.js redesign/celo.scss
  redesign/home.scss home.js
  redesign/cosmoslike.scss
  redesign/cosmoslike.js
  lib/figment-promo.bundled.js
  redesign/near.scss
  redesign/near.js
]
