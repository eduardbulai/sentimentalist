function loadRequest() {
  $.getJSON('/dashboard/index/', function(response) {

    console.log(response.user.resque_complete);
    loadComplete = response.user.resque_complete;

    if (loadComplete) {
      window.location='/dashboard';
    } else {
      setTimeout( loadRequest, 1000);
    }

  });
}