
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
            @file_java = FILE_JAVA.new(path)
            @hssf = (HSSF_WORKBOOK)WORKBOOK_FACTORY.create(@file_java)
            @biff8_key = BIFF8_ENCRYPTION_KEY
            @wb = HSSFWorkbook.new
          end

          def encryptor_password
            @biff8_key.setCurrentUserPassword(password)
            @hssf.close
          end

        #   def write_into_encrypted_output_stream
        #     @output_stream = @enc.getDataStream(@file_system)
        #     IO_UTILS.copy(@input_stream, @output_stream)
        #     @output_stream.close
        #     @input_stream.close
        #   end

          def file_output_stream
            file_output_stream = FILE_OUTPUT_STREAM.new(path)
            @wb.write(file_output_stream)
          end
    end
end