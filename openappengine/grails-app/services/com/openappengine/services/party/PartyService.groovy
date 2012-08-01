package com.openappengine.services.party

import com.openappengine.model.party.Person

class PartyService {

    def createPersonParty(Person person) {
		if(person == null) {
			throw new IllegalArgumentException("Party Instance found null.");
		}
		
		person.partyType = "PERSON"
		
		if (!person.save(flush: true)) {
			person
		}
    }
}
