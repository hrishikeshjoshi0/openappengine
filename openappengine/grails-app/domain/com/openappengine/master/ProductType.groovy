/**
 * 
 */
package com.openappengine.master

/**
 * @author hrishi
 *
 */
enum ProductType {
	
	SERVICE("SERVICE"),
	PRODUCT("PRODUCT")
	
	final String name
	String toString() { name }
	ProductType(String name) { this.name = name }
	String getKey() { name }

}
