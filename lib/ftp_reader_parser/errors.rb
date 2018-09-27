module FtpReaderParser
  class Error < StandardError; end
  class FtpError < Error; end
  class AuthorizationError < FtpError; end
  class UnAuthorizationError < AuthorizationError; end
  class NoDirReadError < FtpError; end
  class EmptyDirReadError < FtpError; end
  class NoFileNameReadError < FtpError; end
end
