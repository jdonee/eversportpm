package com.jdonee.excel

import java.io.IOException;

import org.codehaus.groovy.grails.commons.*
import net.sf.jxls.exception.ParsePropertyException
import net.sf.jxls.transformer.XLSTransformer
import org.apache.poi.hssf.usermodel.HSSFWorkbook
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;

import com.jdonee.utils.Constants

class SimpleExcelUtils {

	/**
	 * 原生Excel处理
	 */
	static String execute(sourceFile,beans,targetFile) throws IOException, ParsePropertyException, InvalidFormatException {
		XLSTransformer transformer = new XLSTransformer()
		String templatePath=System.properties['base.dir']+Constants.EXCEL_TEMPLATE_FOLDER+sourceFile+Constants.EXCEL_FILE_EXT
		String outputPath=System.properties['base.dir']+Constants.OUTPUT_BASE_FOLDER+targetFile+Constants.EXCEL_FILE_EXT
		transformer.transformXLS(templatePath, beans,outputPath)
		return outputPath
	}

}
