import openappengine.sec.Role
import openappengine.sec.User
import openappengine.sec.UserRole

class BootStrap {
	
	def springSecurityService

    def init = { servletContext ->
		
		//Create Admin Role if doesn't exist
		def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
		def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
		
		//Create Admin User.
		def adminUser = User.findByUsername('admin') ?: new User(
			username: 'admin',
			password: 'admin',
			enabled: true).save(failOnError: true)

		if (!adminUser.authorities.contains(adminRole)) {
			UserRole.create adminUser, adminRole
		}
    }
	
    def destroy = {
    }
}
