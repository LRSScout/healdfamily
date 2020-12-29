<cfoutput>

<h1>Account <cfif structKeyExists(prc, "updated")><span class="badge badge-secondary">Updated</span></cfif></h1> 

<cfoutput>
    <form action="#event.buildLink("login/update")#" method="post">
        <input type="hidden" name="userID" value="#session.user.userID#">
        <div class="row">
            <div class="col col-sm-6">
                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input name="firstName" type="text" value="#session.user.firstName#" class="form-control">
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name</label>
                    <input name="lastName" type="text" value="#session.user.lastName#" class="form-control">
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input name="email" type="email" value="#session.user.email#" class="form-control">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input name="password" type="text" value="#session.user.password#" class="form-control">
                </div>
            </div>
            <div class="col col-sm-6">
                <div class="form-group">
                    <label for="address">Address</label>
                    <input name="address" type="text" value="#session.user.address#" class="form-control">
                </div>
                <div class="form-group">
                    <label for="city">City</label>
                    <input name="city" type="text" value="#session.user.city#" class="form-control">
                </div>
                <div class="form-group">
                    <label for="state">State</label>
                    <input name="state" type="text" value="#session.user.state#" class="form-control">
                </div>
                <div class="form-group">
                    <label for="zip">Zip</label>
                    <input name="zip" type="text" value="#session.user.zip#" class="form-control">
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number</label>
                    <input name="phoneNumber" type="text" value="#session.user.phoneNumber#" class="form-control">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col col-sm-12 text-center">
                <button name="submit" value="Submit" type="submit" class="btn btn-primary">Submit</button>
            </div>
        </div>
    </form>
</cfoutput>
</cfoutput>