/**
 * 
 */
package com.openappengine.master

/**
 * @author hrishi
 *
 */
enum OrderStatus {
	
	NEW("NEW"),
	INVOICED("INVOICED"),
	COMPLETE("COMPLETE"),
	CANCELLED("CANCELLED")
	
	final String name
	String toString() { name }
	OrderStatus(String name) { this.name = name }
	String getKey() { name }

}
