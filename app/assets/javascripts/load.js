function loadRequest() {
  $.getJSON('/dashboard/index/', function(response) {

    loadComplete = response.user.resque_complete;

    if (loadComplete) {
      window.location='/dashboard';
    } else {
      setTimeout( loadRequest, 1000);
    }

  });
}
