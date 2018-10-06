# http-configuration
This is a configuration extension for `HTTP` module, first intended purpose is only to configure `base_uri` for `HTTP` request target by explicitly specifying the `host`,`port`,`ssl` `BaseURI` class attribute.

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
=> "https://my.private.api"

```
