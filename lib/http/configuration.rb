require 'http'

module HTTP

  class Configuration

    attr_accessor :base_uri, :base_headers

    def initialize(attributes = {})
      @base_uri     = BaseURI.new(attributes[:base_uri] || {})
      @base_headers = BaseHeaders.new(attributes[:base_headers] || {})
    end

    class BaseURI

      attr_accessor :host, :port, :ssl
      
      def initialize(attributes = {})
        @host = attributes[:host] || 'localhost'
        @port = attributes[:port] || 80
        @ssl  = attributes[:ssl]  || false
      end

      def use_ssl?
        @ssl
      end

      def uri
        if use_ssl? && @port == 80
          "https://#{@host}"
        elsif use_ssl? && @port != 80
          "https://#{@host}:#{@port}"
        else
          "http://#{@host}:#{@port}"
        end        
      end  
    end

    class BaseHeaders

      extend Forwardable
      include HTTP::Headers::Mixin
      
      def initialize(attributes = {})
        @headers = HTTP::Headers.new
        attributes.each do |key, val|
          @headers[key] = val
        end
      end

      def content_type
        @headers[:content_type]
      end

      def content_type=(value)
        @headers[:content_type] = value
      end

      def_delegator :headers, :each
      def_delegator :headers, :to_hash
    end

    module Mixin

      attr_reader :configuration

      def configure
        @configuration ||= Configuration.new

        if block_given?
          yield(@configuration)
        end

        after_configure
      end

      def base_uri
        @configuration&.base_uri&.uri
      end

      def base_headers
        @configuration&.base_headers || {}
      end

      def configuration_reset!
        @configuration = nil
      end

      def after_configure
        raise NotImplementedError, "You must implement `after_configure` hook"
      end
    end

  end
end
