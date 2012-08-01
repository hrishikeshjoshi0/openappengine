/**
 * 
 */
package com.openappengine.services.contract;

/**
 * @author hrishi
 *
 */
public class ContractCreationException extends Exception {

	private static final long serialVersionUID = 1L;

	public ContractCreationException() {
		super();
	}

	public ContractCreationException(String message, Throwable cause) {
		super(message, cause);
	}

	public ContractCreationException(String message) {
		super(message);
	}

	public ContractCreationException(Throwable cause) {
		super(cause);
	}

}
