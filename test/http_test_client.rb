# frozen_string_literal: true

class HTTPTestClient
  Response = Struct.new(:body) do
    def code; '200'; end
  end

  class << self
    attr_accessor :last_url
  end

  attr_accessor :body

  def initialize(_config); end

  def get(url)
    self.class.last_url = url
    HTTPTestClient::Response.new(body)
  end
end

class HTTPTestClientFactory
  def initialize(body)
    @body = body
  end

  def new(config)
    HTTPTestClient.new(config).tap { |c| c.body = @body }
  end
end
