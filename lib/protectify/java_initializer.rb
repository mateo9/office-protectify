require 'rjb'

folder = File.expand_path("../", File.dirname(__FILE__))
class_path = Dir["#{folder}/java_jars/*.jar"].map { |path| File::PATH_SEPARATOR + File.expand_path(path) }.sort.join('')

Rjb::load class_path
FILE_OUTPUT_STREAM = Rjb::import('java.io.FileOutputStream')
FILE_INPUT_STREAM = Rjb::import('java.io.FileInputStream')
FILE_JAVA = Rjb::import('java.io.File')
POI_FILE_SYSTEM = Rjb::import('org.apache.poi.poifs.filesystem.POIFSFileSystem')
XSSF_WORKBOOK = Rjb::import('org.apache.poi.xssf.usermodel.XSSFWorkbook')
HSSF_WORKBOOK = Rjb::import('org.apache.poi.hssf.usermodel.HSSFWorkbook')
CRYPTO_FUNCTIONS = Rjb::import('org.apache.poi.poifs.crypt.CryptoFunctions')
ENCRYPTION_INFO = Rjb::import('org.apache.poi.poifs.crypt.EncryptionInfo') 
ENCRYPTION_MODE = Rjb::import('org.apache.poi.poifs.crypt.EncryptionMode') 
WORKBOOK_FACTORY = Rjb::import('org.apache.poi.ss.usermodel.WorkbookFactory')
IO_UTILS = Rjb::import('org.apache.poi.util.IOUtils')