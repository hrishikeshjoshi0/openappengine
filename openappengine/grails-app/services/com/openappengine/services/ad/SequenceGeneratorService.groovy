package com.openappengine.services.ad

import org.springframework.transaction.annotation.Transactional;

import com.openappengine.model.ad.AdSequence;

class SequenceGeneratorService {

	@Transactional
    String getNextSequenceNumber(String sequenceName) {
		def adSequence = AdSequence.findBySequenceName(sequenceName)
		if(!adSequence) {
			AdSequence ad = new AdSequence()
			ad.prefix = ""
			ad.sequenceName = sequenceName
			ad.sequenceValue = 0
			ad.save(flush:true)
			
			adSequence = ad
		}

		adSequence.sequenceValue = adSequence.sequenceValue + 1
		adSequence.save(flush:true)		
		
		return adSequence.prefix + "" + String.format("%05d",adSequence.sequenceValue)
    }
}
