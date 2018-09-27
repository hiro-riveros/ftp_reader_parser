require 'net/ftp'
module FtpReaderParser
  class Connection
    attr_accessor :ftp, :user, :password, :errors
    def initialize
      @ftp = Net::FTP.new(FtpReaderParser.config.host)
      @user = FtpReaderParser.config.user
      @password = FtpReaderParser.config.password
      @errors = []
    end

    def login
      validate_auth
      raise @errors.pop unless @errors.empty?
      raise UnAuthorizationError unless @ftp.login(@user, @password)
      @ftp.passive = true
    end

    def logout
      @ftp.close
    end

    private

    def validate_auth
      @errors << AuthorizationError if @user.empty?
      @errors << AuthorizationError if @password.empty?
    end
  end
end