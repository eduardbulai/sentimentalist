function loadRequest() {
  $.getJSON('/dashboard/index/', function(response) {

    while(true){
      console.log(response.user.resque_complete);
      loadComplete = response.user.resque_complete;

      if (loadComplete) {
        window.location='/dashboard';
        break;
      }
    }

  });
}
