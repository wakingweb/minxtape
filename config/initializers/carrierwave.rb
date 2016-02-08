Rails.env.production? ? (bucket_name = "minxtape-production") : (bucket_name = "minxtape-production")

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                                       # required
    aws_access_key_id:     'AKIAIC2NAMMXMCERT24A',                      # required
    aws_secret_access_key: '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',  # required
    region:                'us-west-2',
  }
  config.fog_directory  = bucket_name                                       # required
end
