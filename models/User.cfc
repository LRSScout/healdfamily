/**
 * I am a new Model Object
 */
component accessors="true"{

	/**
	 * Constructor
	 */
	User function init(){

		return this;
	}

	/**
	 * getUser
	 */
	function getUser(event, rc, prc){
		getUser = queryExecute("
			select *
			from users
			where userID = ?
		",
			[session.user.userID]
		)

		return getUser;
	}

	/**
	 * UpdateUser
	 */
	function UpdateUser(event, rc, prc){
		updateUser = queryExecute("
			update Users
			set firstName = ?,
			lastName = ?,
			email = ?,
			password = ?,
			address = ?,
			state = ?,
			zip = ?,
			phoneNumber = ?,
			city = ?
			where userID = ?
		",
			[rc.firstName,rc.lastName,rc.email,rc.password,rc.address,rc.state,rc.zip,rc.phoneNumber,rc.city,rc.userID]
		);

		user = this.getUser(event, rc, prc);
		session.user = user;

		return updateUser;
	}

	/**
	 * AuthenticateUser
	 */
	function AuthenticateUser(email,password){
		qryUser = queryExecute("
			select *
			from users
			where email = ?
			and password = ?
		",
			[email,password]
		);

		return qryUser;
	}

	/**
	 * DeleteUser
	 */
	function DeleteUser(userID){

	}


}