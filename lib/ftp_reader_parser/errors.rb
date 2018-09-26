module FtpReaderParser
  class Error < StandardError; end
  class ServerError < Error; end
  class AuthorizationError < ServerError; end
  class UnAuthorizationError < AuthorizationError; end
end
