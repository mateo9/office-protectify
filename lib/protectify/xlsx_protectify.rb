
module Protectify
    class XlsxProtectify
        def initialize(path, password)
            @path = path
            @password = password
            call
        end

        def call
            initialize_java_class
            encryptor_password
            write_into_encrypted_output_stream
            file_output_stream
        end

        private

        attr_reader :path, :password

        def initialize_java_class
            @file_system = POI_FILE_SYSTEM.new
            @encryption_mode = ENCRYPTION_MODE
            @info = ENCRYPTION_INFO.new(@encryption_mode.agile)
            @file_java = FILE_JAVA.new(path)
            @input_stream = FILE_INPUT_STREAM.new(@file_java)
          end

          def encryptor_password
            @enc = @info.getEncryptor
            @enc.confirmPassword(password)
          end

          def write_into_encrypted_output_stream
            @output_stream = @enc.getDataStream(@file_system)
            IO_UTILS.copy(@input_stream, @output_stream)
            @output_stream.close
            @input_stream.close
          end

          def file_output_stream
            file_output_stream = FILE_OUTPUT_STREAM.new(path)
            @file_system.writeFilesystem(file_output_stream)
            file_output_stream.close
            @file_system.close
          end
    end
end