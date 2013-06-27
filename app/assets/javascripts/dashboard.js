$(document).ready( function() {

  // function to ping finished=false
  // while ^^ is false, call function JSON call to load new stuff into the view
  //    --> if conditions inside this function checking if array is full
  // istotope add item

  function resqueJobComplete() {
    $.getJSON('/dashboard/index/', function(response) {
      loadComplete = response.user.resque_complete;
    });
    return loadComplete;
  }

  // function serverRequestFollowers(alreadyRenderedFollowers) {
  //   $.getJSON('/dashboard/index', function(response) {
  //     $.each(followers, function() {
  //       if (!jQuery.inArray(this.id, alreadyRenderedFollowers > -1)) {
  //         $('#small-icons').after(HandlebarsTemplates['followers/followers'](this));
  //         alreadyRenderedFollowers.push(this.id);
  //         // consider isotope addItems() call here
  //       }
  //     });
  //   });
  //   return alreadyRenderedFollowers;
  // }

  // function serverRequestUserTweets(alreadyRenderedUserTweets) {
  //   $.getJSON('/dashboard/index', function(response) {
  //     $.each(user_tweets, function() {
  //       if (!jQuery.inArray(this.id, alreadyRenderedUserTweets > -1)) {
  //         $('#small-icons').after(HandlebarsTemplates['user_tweets/user_tweets'](this));
  //         alreadyRenderedUserTweets.push(this.id);
  //         // consider isotope addItems() call here
  //       }
  //     });
  //   });
  //   return alreadyRenderedUserTweets;
  // }

  var alreadyRenderedFollowers=[];
  var alreadyRenderedUserTweets=[];

  while(true) {
    if (resqueJobComplete){
      break;
    }else {
      $.getJSON('/dashboard/index', function(response) {
        var followers = response.followers;
        $.each(followers, function() {
          if (!jQuery.inArray(this.id, alreadyRenderedFollowers > -1)) {
            $('#small-icons').after(HandlebarsTemplates['followers/followers'](this));
            alreadyRenderedFollowers.push(this.id);
            // consider isotope addItems() call here
          }
        });
      });

      console.log(followers);

      $.getJSON('/dashboard/index', function(response) {
        var user_tweets = response.user_tweets;
        $.each(user_tweets, function() {
          if (!jQuery.inArray(this.id, alreadyRenderedUserTweets > -1)) {
            $('#small-icons').after(HandlebarsTemplates['user_tweets/user_tweets'](this));
            alreadyRenderedUserTweets.push(this.id);
            // consider isotope addItems() call here
          }
        });
      });

    }
  }

});


//   function myRequest() {
//     $.getJSON('/dashboard/index/', function(response) {
//       console.log(response.user.resque_complete);
//       loadComplete = response.user.resque_complete;

//         if (!loadComplete) {
//           $('#dashboard-loading-modal').show();
//         }
//         else {
//           $('#dashboard-loading-modal').hide();
//           location.reload();
//         }
//       });
//   }



// $(document).ready( function() {

//   function myRequest(alreadyRenderedFollowers,alreadyRenderedUserTweets) {
//     $.getJSON('/dashboard/index', function(response) {
//       var followers = response.followers;
//       $.each(followers, function() {
//         if (jQuery.inArray(this.id, alreadyRenderedFollowers > -1)) {
//           $('#small-icons').after(HandlebarsTemplates['followers/followers'](this));
//           alreadyRenderedFollowers.push(this.id);
//         }
//       });

//       var user_tweets = response.user_tweets;
//       $.each(user_tweets, function() {
//         if (jQuery.inArray(this.id, alreadyRenderedUserTweets > -1)){
//           $('#small-icons').after(HandlebarsTemplates['user_tweets/user_tweets'](this));
//           alreadyRenderedUserTweets.push(this.id);
//         }
//       });
//     return [alreadyRenderedFollowers, alreadyRenderedUserTweets];
//     });
//   }

//   function setIconField(elements) {

//     if (elements){
//       var newElements = myRequest(elements[0],elements[1]);
//     } else {
//       var newElements = [[],[]]
//     }

//     setTimeout (setIconField(newElements), 1000);
//   }

//   var alreadyRenderedElements = [[],[]];

//   setIconField(alreadyRenderedElements);

// });



  // var source   = $("#some-template").html();
  // var template = Handlebars.compile(source);
  // var data = { users: [
  //     {username: "alan", firstName: "Alan", lastName: "Johnson", email: "alan@test.com" },
  //     {username: "allison", firstName: "Allison", lastName: "House", email: "allison@test.com" },
  //     {username: "ryan", firstName: "Ryan", lastName: "Carson", email: "ryan@test.com" }
  //   ]};
  // $("#content-placeholder").html(template(data));
