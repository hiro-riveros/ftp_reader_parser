module FtpReaderParser
  class Config
    attr_accessor :user, :password, :host, :version

    def initialize
      @version ||= '1'.freeze
    end
  end

  def self.config
    @config ||= Config.new
  end

  def self.configuration(&block)
    yield(config) if block_given?
  end
end
