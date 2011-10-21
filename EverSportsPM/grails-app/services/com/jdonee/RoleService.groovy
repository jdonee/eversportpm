package com.jdonee

class RoleService {

    static transactional = true

    def searchRoleByAuthority(authority) {
		return Role.findAllByAuthorityLike(authority + '%').collect() {
			return [
					id: it.id,
					label: it.authority+"["+it.alias+"]",
					value: it.authority
			]
		}
	 }
}
