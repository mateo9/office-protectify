
module Protectify
    class XlsProtectify
        def initialize(path, password)
            @path = path
            @password = password
            call
        end

        def call
            initialize_java_class
            encryptor_password
            file_output_stream
        end

        private

        attr_reader :path, :password

        def initialize_java_class
            @file_input_stream = FILE_INPUT_STREAM.new(path)
            @biff8_key = BIFF8_ENCRYPTION_KEY
            @wb = HSSF_WORKBOOK.new(@file_input_stream)
          end

          def encryptor_password
            @biff8_key.setCurrentUserPassword(password)
          end

          def file_output_stream
            file_output_stream = FILE_OUTPUT_STREAM.new(path)
            @wb.write(file_output_stream)
          end
    end
end