# Postnord

Unofficial Postnord gem for tracking shipments, calculating transmit times and finding service points.

For more information and specifications, please visit https://developer.postnord.com/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'postnord'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install postnord

## Usage

Add configuration to `config/initializers/postnord.rb`:

```ruby
POSTNORD_API_KEY = 'CHANGEME'
POSTNORD_API_VERSION = 'v1' # default
POSTNORD_API_ENDPOINT = 'https://api2.postnord.com/rest' # default
POSTNORD_LOCALE = 'en' # default
POSTNORD_RETURN_TYPE = 'json' # default
```

How to fetch a package with the test identifier from [developer documentation](https://developer.postnord.com/docs#!/trackandtrace/findByIdentifier) using a helper method:

```ruby
> response = Postnord.find_by_identifier('84971563697SE')
> response.code # => 200
> response.status # => OK
> response.data # => {"TrackingInformationResponse"=>{"shipments"=>[]}}
```

How to calculate transmit time using the class method `call`:

```ruby
> response = Postnord::GetTransitTimeInformation.call({dateOfDeparture: '2016-04-01', serviceGroupCode: 'SE', fromAddressPostalCode: '11827', fromAddressCountryCode: 'SE', toAddressPostalCode: '98132', toAddressCountryCode: 'SE', serviceCode:'15'})
> response.data # => {"se.posten.loab.lisp.notis.publicapi.serviceapi.TransitTimeResponse"=>{"transitTimes"=>[{"dateOfDeparture"=>"2016-04-01 18:00:00.0 CEST", "latestTimeOfBooking"=>"14:00", "deliveryTime"=>"17:00", "deliveryDate"=>"20160405", "transitTimeInDays"=>4, "possibleDeviation"=>false, "service"=>{"code"=>"15", "groupCode"=>"SE", "name"=>"DPD Företagspaket", "pickup"=>true, "distribution"=>true}, "daysPickup"=>["MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY"]}]}}
```

Validation of parameters:
```ruby
> response = Postnord::GetTransitTimeInformation.call({}) # => Postnord::Base::MissingMandatoryParameters: ["serviceGroupCode", "fromAddressPostalCode", "fromAddressCountryCode", "toAddressPostalCode", "toAddressCountryCode"]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/apoex/postnord. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

