/**
 * 
 */
package com.openappengine.master

/**
 * @author hrishi
 *
 */
enum PartyStatus {
	
	PARTY_ENABLED("PARTY_ENABLED"),
	PARTY_TERMINATED("PARTY_TERMINATED")
	
	final String name
	String toString() { name }
	PartyStatus(String name) { this.name = name }
	String getKey() { name }

}
