$(document).ready( function() {

  function myRequest() {
    $.getJSON('/dashboard/index', function(response) {
      var followers = response.followers;
      $.each(followers, function() {
        var stuff = HandlebarsTemplates['followers/followers'](this);
        debugger;
        $('#small-icons').after(HandlebarsTemplates['followers/followers'](this));
      });

      var user_tweets = response.user_tweets;
      $.each(user_tweets, function() {
        $('#small-icons').after(HandlebarsTemplates['user_tweets/user_tweets'](this));
      });
    });
  }

  function setIconField() {

    myRequest();

    setTimeout (setIconField, 1000);
  }

  setIconField();

});












  // var source   = $("#some-template").html();
  // var template = Handlebars.compile(source);
  // var data = { users: [
  //     {username: "alan", firstName: "Alan", lastName: "Johnson", email: "alan@test.com" },
  //     {username: "allison", firstName: "Allison", lastName: "House", email: "allison@test.com" },
  //     {username: "ryan", firstName: "Ryan", lastName: "Carson", email: "ryan@test.com" }
  //   ]};
  // $("#content-placeholder").html(template(data));
