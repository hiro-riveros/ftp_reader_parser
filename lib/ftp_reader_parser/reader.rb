module FtpReaderParser
  class Reader
    attr_accessor :object
    def initialize(object)
      @object = object
    end

    def read_directory
      validate_dir_presence
      # TODO: get list of files with name inside directory
      # TODO: iterate thought list
      # TODO: response with parsed data
      read
    end

    def read
      connection.login
      check_empty_dir
      # TODO: IMPLEMENT HEADER FILE READER TO CREATE JSON OBJECT
      puts read_file

      connection.logout
    end

    private

    def validate_dir_presence
      raise NoDirReadError if dir.empty?
    end

    def check_empty_dir
      connection.ftp.chdir(dir)
      raise EmptyDirReadError if connection.ftp.nlst('*.csv').empty?
    end

    def read_file(file = nil)
      raise NoFileNameReadError if file_name.empty? && file.nil?
      connection.ftp.retrbinary("RETR #{file_name || file}", Net::FTP::DEFAULT_BLOCKSIZE) do |block|
        return block
      end
    end

    def dir
      object[:dir]
    end

    def file_name
      object[:file_name]
    end

    def connection
      object[:connection]
    end

    def parser
      object[:parser]
    end
  end
end
