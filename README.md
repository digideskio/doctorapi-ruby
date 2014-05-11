# Doctorapi

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'doctorapi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install doctorapi

## Usage

```ruby
api = Doctorapi::Client.new
api.host = "http://localhost:3000"
api.authentication_token = "492fe3c6-5b2f-4ec9-897b-3b7d836ce61d"
api.patient_issues.each do |i|
  puts i.to_s
end
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/doctorapi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
