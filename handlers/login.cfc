/**
 * I am a new handler
 */
component{
	
	property name="User" inject="User";

	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};

	/**
	IMPLICIT FUNCTIONS: Uncomment to use

	function preHandler( event, rc, prc, action, eventArguments ){
	}
	function postHandler( event, rc, prc, action, eventArguments ){
	}
	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		// executed targeted action
		arguments.targetAction( event );
	}
	function onMissingAction( event, rc, prc, missingAction, eventArguments ){
	}
	function onError( event, rc, prc, faultAction, exception, eventArguments ){
	}
	function onInvalidHTTPMethod( event, rc, prc, faultAction, eventArguments ){
	}
	*/

	/**
	 * index
	 */
	function index( event, rc, prc ){	
		prc.AuthenticateUser = User.AuthenticateUser(rc.email, rc.password);
		if(prc.AuthenticateUser.recordCount){
			prc.authenticated = 1
			session.user = prc.AuthenticateUser;
			var myUser = User.getUser(session.user.userID);
		}else{
			prc.authenticated = 0
		}

		

		event.setView( "main/index" );
	}

	/**
	 * edit
	 */
	function edit( event, rc, prc ){
		event.setView( "login/edit" );
	}

	/**
	 * update
	 */
	function update( event, rc, prc ){
		prc.UpdateUser = User.UpdateUser(event,rc,prc);
		prc.updated = 1;
		event.setView( "login/edit" );

	}

	/**
	 * check
	 */
	function check( event, rc, prc ){
		event.setView( "login/check" );
	}

	function logout(event,rc,prc){
		temp = structDelete(session, "User");
		event.setView("main/index");
	}



}
