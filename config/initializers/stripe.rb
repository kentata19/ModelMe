#開発環境とテスト環境にはstripeのテストモードのAPIキーを使用する
if Rails.env.development? || Rails.env.test?
  Rails.configuration.stripe = {
    :publishable_key => Rails.application.credentials.stripe[:publishable_key],
    :secret_key      => Rails.application.credentials.stripe[:secret_key]
  }
end

#本番環境にはstripeの本番環境用APIキーを使用する
if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => Rails.application.credentials.stripe[:publishable_key],
    :secret_key      => Rails.application.credentials.stripe[:secret_key]
  }
end

#それぞれの環境に適したstripeAPIキーをセットしておく。
Stripe.api_key = Rails.configuration.stripe[:secret_key]