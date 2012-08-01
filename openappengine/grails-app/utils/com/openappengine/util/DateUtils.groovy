/**
 * 
 */
package com.openappengine.util

/**
 * @author hrishikesh.joshi
 *
 */
class DateUtils {
	
	public static boolean isDateBetweenTwoDatesInclusive(Date fromDate, Date toDate, Date aspectDate) {
		if ((aspectDate.after(fromDate) || aspectDate.equals(fromDate))
				&& (aspectDate.before(toDate) || aspectDate.equals(toDate))) {
			return true;
		}
		return false;
	}
	
	public static Date getFirstDayOfMonth(Date dt) {
		if(!dt) {
			throw new RuntimeException("Input date cannot be null.")
		}
		
		dt = org.apache.commons.lang.time.DateUtils.setDays(dt, 1)
		return dt
	}
	
	public static Date getLastDayOfMonth(Date dt) {
		if(!dt) {
			throw new RuntimeException("Input date cannot be null.")
		}
		
		dt = org.apache.commons.lang.time.DateUtils.addMonths(dt, 1)
		dt = org.apache.commons.lang.time.DateUtils.addDays(dt, -1)
		return dt
	}

}
