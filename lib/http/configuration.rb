require 'http'

module HTTP

  module Configuration

    VERSION = '0.0.1'

    def base_uri
      @base_uri&.uri
    end
    
    def base_uri=(attributes)
      @base_uri ||= BaseURI.new(attributes)
    end

    def base_uri_reset!
      @base_uri = nil
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

  end
end
