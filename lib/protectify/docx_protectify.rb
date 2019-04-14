
module Protectify
    class DocxProtectify < Protectify::XlsxProtectify
        def initialize(path, password)
            @path = path
            @password = password
            call
        end
    end
end