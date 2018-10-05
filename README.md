# http-configuration
`HTTP::Configuration` is a configuration extension for `HTTP` module, first intended purpose is only to configure `base_uri` for `HTTP` request target by explicitly specifying the `host`,`port`,`ssl` `BaseURI` class attribute.

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'http-configuration', :git => 'https://github.com/xyzkab/http-configuration'
```

And then execute:
```bash
$ bundle install
```

## Documentation

### Basic Usage

Here's some simple examples to get you started:

```ruby
require 'http/configuration'

class MyPrivateAPI

  extend HTTP::Configuration

end

>> MyPrivateAPI.base_uri = {host: "my.private.api", ssl: true}
>> MyPrivateAPI.base_uri
=> #<HTTP::Configuration::BaseURI:0x00005652ef74b7b8 @host="my.private.api", @port=80, @ssl=true>
>> MyPrivateAPI.uri
=> "https://my.private.api"
>> MyPrivateAPI.base_uri_reset!
=> nil

```
