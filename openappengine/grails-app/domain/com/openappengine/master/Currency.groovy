/**
 * 
 */
package com.openappengine.master

/**
 * @author hrishi
 *
 */
public enum Currency {

	INR('INR')
	
	final String name
	String toString() { name }
	Currency(String name) { this.name = name }
	String getKey() { name }
}
