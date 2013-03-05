Rails.env.production? ? (bucket_name = "minxtape") : (bucket_name = "minxtape-dev")

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                                       # required
    :aws_access_key_id      => 'AKIAJRNZ6KCCVABGARPQ',                      # required
    :aws_secret_access_key  => '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'   # required
  }
  config.fog_directory  = bucket_name                                       # required
end