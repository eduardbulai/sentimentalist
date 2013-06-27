$(document).ready( function() {

  var dashboardLoaded = false;

  function myRequest() {
    $.getJSON('/dashboard/index/', function(response) {
      console.log(response.user.resque_complete);
      loadComplete = response.user.resque_complete;

        if (loadComplete) {
          window.location='/dashboard';
        }

      });
  }

  function setIconfield() {

    if (!dashboardLoaded) {
      myRequest();

      setTimeout( setIconfield, 1000);
    }
  }


  setIconfield();

});
