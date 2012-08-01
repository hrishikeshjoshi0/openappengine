/**
 * 
 */
package com.openappengine.master

/**
 * @author hrishi
 *
 */
public enum OrderRecurrence {

	M('1'),
	Q('3'),
	T('4'),
	Y('12'),
		
	final String name
	String toString() { name }
	OrderRecurrence(String name) { this.name = name }
	String getKey() { name }
}
