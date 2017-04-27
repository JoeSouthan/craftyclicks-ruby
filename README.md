# CraftyClicks
[![Build Status](https://travis-ci.org/JoeSouthan/craftyclicks-ruby.svg?branch=master)](https://travis-ci.org/JoeSouthan/craftyclicks-ruby)
[![Code Climate](https://codeclimate.com/github/JoeSouthan/craftyclicks-ruby/badges/gpa.svg)](https://codeclimate.com/github/JoeSouthan/craftyclicks-ruby)

A simple wrapper around the CraftyClicks APIs 🌍

[ClickToAddress](https://craftyclicks.co.uk/docs/global/#json-api) | [RapidAddress](https://craftyclicks.co.uk/docs/postcode-lookup/#json-api)

This is a WIP, expect the implementation to change

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'craftyclicks-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install craftyclicks-ruby

## Usage

Set your API key

```ruby
CraftyClicks.configure do |c|
  c.api_key = 'API_KEY'
end

```

### [Address lookup](https://craftyclicks.co.uk/docs/global/#json-api):

```ruby
CraftyClicks::AddressLookup.find(query: 'Buckingham Palace', country: 'GB')
CraftyClicks::AddressLookup.retrieve(id: '26086283', country: 'GB')
```

### [Postcode lookup](https://craftyclicks.co.uk/docs/postcode-lookup/#json-api)

```ruby
CraftyClicks::PostcodeLookup.full_address(postcode: 'AA11AA')
CraftyClicks::PostcodeLookup.basic_address(postcode: 'AA11AA')
```

#### [Geocode](https://craftyclicks.co.uk/docs/postcode-lookup/#geocoding)

Use "Postcode lookup" rather than individually geocoding postcodes

```ruby
CraftyClicks::Geocode.geocode(postcodes: ['AA11AA', 'AA11AB'])
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Joseph Southan/craftyclicks.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

