Airbrake.configure do |config|
  config.api_key = 'b4e620408834ff449bef72fe4d6b319b'
  config.host    = 'errbit.hut.shefcompsci.org.uk'
  config.port    = 443
  config.secure  = config.port == 443
end