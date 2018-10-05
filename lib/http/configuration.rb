require 'http'

module HTTP

  module Configuration

    def base_uri
      @base_uri ||= BaseURI.new
    end
    
    def base_uri=(attributes)
      @base_uri ||= BaseURI.new(attributes)
    end

    class BaseURI

      attr_accessor :host, :port, :ssl
      
      def initialize(attributes = {})
        @host = attributes[:host] || 'localhost'
        @port = attributes[:port] || 80
        @ssl  = attributes[:ssl]  || false
      end

      def use_ssl?
        @ssl ? true : false
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