require 'java_initializer'

module Protectify
    class XlsxProtectify
        def initialize(path, password)
            @path = path
            @password = password
        end

        def call
            initialize_java_class
            encryptor_password
            write_into_encrypted_output_stream
            file_output_streamq
        end

        private

        attr_reader :path, :password

        def initialize_java_class
            @fs = POI_FILE_SYSTEM.new
            @encryption_mode = ENCRYPTION_MODE
            @info = ENCRYPTION_INFO.new(@encryption_mode.agile)
            @fj = FILE_JAVA.new(path)
            @is = FILE_INPUT_STREAM.new(@fj)
          end

          def encryptor_password
            @enc = @info.getEncryptor
            @enc.confirmPassword(password)
          end

          def write_into_encrypted_output_stream
            @os = @enc.getDataStream(@fs)
            IO_UTILS.copy(@is, @os)
            @os.close
            @is.close
          end

          def file_output_stream
            delete_file
            @path = FILE_JAVA.new(path)
            @fos = FILE_OUTPUT_STREAM.new(@path)
            @fs.writeFilesystem(@fos)
            @fos.close
            @fs.close
          end

          def delete_file
            File.delete(path)
          end
    end
end