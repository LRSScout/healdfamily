<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha256-4+XzXVhsDmqanXGHaHvgh1gMQKX40OUvDEBTu8JcmNs=" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">    
    <script src="https://kit.fontawesome.com/5ce9b52544.js" crossorigin="anonymous"></script>
    <link href="/css/heald.css" rel="stylesheet">
    <script src="/js/heald.js"></script>
    <!---Base URL --->
	  <base href="#event.getHTMLBaseURL()#" />

    <title>Heald Family</title>
</head>

<body>
    <header>
      <!-- Fixed navbar -->
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="#"><img src="/img/h.png" class="img-fluid"> Heald Family</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
            </li>
            <cfif structKeyExists(session, "User")>
              <li class="nav-item">
                <a class="nav-link" href="<cfoutput>#event.buildLink("inventory/index")#</cfoutput>">Inventory</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Calendar</a>
              </li>
            </cfif>
          </ul>
		<cfif not structKeyExists(session, "user") or not session.user.recordCount>
			<form class="form-inline mt-2 mt-md-0" action="<cfoutput>#event.buildLink('login.index')#</cfoutput>" method="post">
				<input class="form-control mr-sm-2" name="email" type="text" placeholder="Email" aria-label="Email">
				<input class="form-control mr-sm-2" name="password" type="password" placeholder="Password" aria-label="Password">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
			</form>
		<cfelse>
			<cfoutput><a href="##" class="navbar-brand">Welcome #session.user.firstName#</a> <a href="#event.buildLink("login.edit")#" class="nav-link">Account</a> <a href="#event.buildLink("login.logout")#" class="nav-link">Logout</a></cfoutput>
		</cfif>
        </div>
      </nav>
    </header>

    <!-- Begin page content -->
    <main role="main" class="container">
    <div class="row">&nbsp;</div>
    <div class="col text-center">
      <img src="/img/church.jpg" class="rounded">
    </div>
      <h1 class="mt-5">The Heald Family Blog and Calendar</h1>
      <p class="lead">This blog is being started so the family can communicate about everything the Calderwood and Connors properties need.</p>
	  <cfoutput>#renderView()#</cfoutput>
    </main>

    <footer class="footer">
      <div class="container">
        <div class="row">
            <div class="col">
                <span class="text-muted"><cfoutput>#chr(169)#</cfoutput> Tim Heald 2020</span>
            </div>
            <div class="col">
                Design thanks to <a href="https://getbootstrap.com/">Twitter Bootstrap</a>
            </div>
        </div>
        </div>
    </footer>
</body>

</html>