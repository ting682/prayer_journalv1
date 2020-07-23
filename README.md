# CliAdoptPet

Welcome to adopt a pet CLI! This gem is used to search and review pets that are up for adoption based on your zip code. This gem uses [HTTParty](https://github.com/jnunemaker/httparty) to retrieve data from [Petfinder API](https://www.petfinder.com/developers/v2/docs/)

This also makes use of the [dotenv](https://github.com/bkeepers/dotenv) gem to keep access token data safe.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cli_adopt_pet'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install cli_adopt_pet

You will need to have a valid token from [Petfinder](https://www.petfinder.com/developers/v2/docs/) and create file.env from the valid token and call the variable "ACCESS_TOKEN"

## Usage

run './bin/adopt_pet'

Enter a valid zip code and choice of dog or cat. A set of pet profiles will appear showing an email for adoption and status availability.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[ting682]/cli_adopt_pet. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[ting682]/cli_adopt_pet/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CliAdoptPet project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/cli_adopt_pet/blob/master/CODE_OF_CONDUCT.md).
