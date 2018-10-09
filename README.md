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
>> require 'http/configuration'
=> true
>> class MyPrivateAPI
>>   extend HTTP::Configuration::Mixin
>>   def self.after_configure
>>     @configuration
>>   end
>> end
=> MyPrivateAPI
>> MyPrivateAPI.configure do |conf|
?>   conf.base_uri.host = "my.private.api"
>>   conf.base_uri.ssl  = true
>>   conf.base_headers.content_type = "application/json"
>> end
=> #<HTTP::Configuration:0x0000561dd25be488 @base_uri=#<HTTP::Configuration::BaseURI:0x0000561dd25be410 @host="my.private.api", @port=80, @ssl=true>, @base_headers=#<HTTP::Configuration::BaseHeaders:0x0000561dd25be398 @headers=#<HTTP::Headers {"Content-Type"=>"application/json"}>>>
>> MyPrivateAPI.configuration.base_uri.uri
=> "https://my.private.api"
>> MyPrivateAPI.configuration.base_headers.content_type
=> "application/json"
```
