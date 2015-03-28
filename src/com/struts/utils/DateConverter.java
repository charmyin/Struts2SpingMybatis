package com.struts.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.log4j.Logger;

import com.opensymphony.xwork2.conversion.impl.DefaultTypeConverter;

public class DateConverter extends DefaultTypeConverter {

    private static final Logger logger = Logger.getLogger(DateConverter.class);

    private static final String DATETIME_PATTERN = "yyyy-MM-dd HH:mm:ss";

    private static final String DATE_PATTERN = "yyyy-MM-dd";
    
    private static final String MONTH_PATTERN = "yyyy-MM";

    /**
     * Convert value between types
     */
    @SuppressWarnings("unchecked")
    public Object convertValue(Map ognlContext, Object value, Class toType) {
            Object result = null;
            if (toType == Date.class) {
                    result = doConvertToDate(value);
            } else if (toType == String.class) {
                    result = doConvertToString(value);
            }
            return result;
    }

    /**
     * Convert String to Date
     *
     * @param value
     * @return
     */
    private Date doConvertToDate(Object value) {
            Date result = null;

            if (value instanceof String) {
                    try {
						result = DateUtils.parseDate((String) value, new String[] { DATE_PATTERN, DATETIME_PATTERN, MONTH_PATTERN });
					} catch (ParseException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}

                    // all patterns failed, try a milliseconds constructor
                    if (result == null && StringUtils.isNotEmpty((String)value)) {

                            try {
                                    result = new Date(new Long((String) value).longValue());
                            } catch (Exception e) {
                                    logger.error("Converting from milliseconds to Date fails!");
                                    e.printStackTrace();
                            }

                    }

            } else if (value instanceof Object[]) {
                    // let's try to convert the first element only
                    Object[] array = (Object[]) value;

                    if ((array != null) && (array.length >= 1)) {
                            value = array[0];
                            result = doConvertToDate(value);
                    }

            } else if (Date.class.isAssignableFrom(value.getClass())) {
                    result = (Date) value;
            }
            return result;
    }

    /**
     * Convert Date to String
     *
     * @param value
     * @return
     */
    private String doConvertToString(Object value) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DATETIME_PATTERN);
            String result = null;
            if (value instanceof Date) {
                    result = simpleDateFormat.format(value);
            }
            return result;
    }
}
