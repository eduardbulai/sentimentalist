// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require handlebars.runtime
//= require jquery
//= require jquery_ujs
//= require_tree ./templates
//= require_tree .

// $(document).ready( function() {

//   var dashboardLoaded = false;

//   // var runningResqueTask = true;
//   // var firstPass = true;



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

//   function setIconfield() {

//     if (!dashboardLoaded) {
//       myRequest();

//       setTimeout( setIconfield, 1000);
//     }
//   }


//   setIconfield();

// });


// $(document).ready( function() {

//   function myRequest() {
//     $.getJSON('/dashboard/index/', function(user) {

//       // $.each(user.user_tweets, function() {
//       //   renderUserIcon(this);
//       // });

//       $.each(user.followers, function() {
//         renderFollowerIcon(this);
//       });
//     });

//   }

//   function setIconfield() {

//     myRequest();

//     setTimeout( setIconfield, 6000);
//   }

//   setIconfield();

//   // function renderUserIcon(tweet) {
//   //   var tweetEmotion = tweet.emotion;

//   //   if (tweet.emotion==="uncertain") {
//   //     tweetEmotion="Ambiguous";
//   //   }
//   //   else {
//   //     tweetEmotion=tweet.emotion;
//   //   }
//   //   $('#small-icons').append("<div class='emot emotion-"+tweet.emotion+" week user default-classifier' id='icon"+tweet.id+"' ><div class='span2'><div class='emotion-icon'><a data-toggle='modal' href='#evaluate_user_tweet_modal"+tweet.id+"' id='link_to_evaluate_user_tweet_modal"+tweet.id+"' name='evaluate_user_tweet' role='button'><dl class='palette "+tweet.id+" palette-"+tweet.emotion+"'><dd id='icontext"+tweet.id+"'>"+tweetEmotion+"</dd></dl></a></div></div></div>");
//   //   $('#small-icons').append("<div class='emot emotion-"+tweet.emotion+" week user bayesian-classifier' id='icon_bayes"+tweet.id+"' ><div class='span2'><div class='emotion-icon'><a data-toggle='modal' href='#evaluate_user_tweet_modal"+tweet.id+"' id='link_to_evaluate_user_tweet_modal"+tweet.id+"' name='evaluate_user_tweet' role='button'><dl class='palette "+tweet.id+" palette-"+tweet.emotion+"'><dd id='icontext"+tweet.id+"'>"+tweetEmotion+"</dd></dl></a></div></div></div>");
//   // }

//   function renderFollowerIcon(follower) {
//     var tweetEmotionWeekDefault = follower.emotion_week;
//     var tweetEmotionMonthDefault = follower.emotion_month;
//     var tweetEmotionYearDefault = follower.emotion_year;
//     var tweetEmotionWeekBayesian = follower.bayesian_emotion_week;
//     var tweetEmotionMonthBayesian = follower.bayesian_emotion_month;
//     var tweetEmotionYearBayesian = follower.bayesian_emotion_year;
//     var iconContainer = $('#small-icons');
//     var iconBayesianFilterWeek = "<div class='emot emotion-"+tweetEmotionWeekBayesian+" week followers bayesian-classifier' ><div class='span2'><div class='emotion-icon'><dl class='palette palette-"+tweetEmotionWeekBayesian+"'><dt>"+follower.name+"<dd>"+tweetEmotionWeekBayesian+"</dd></dt></dl></div></div></div>";
//     var iconDefaultFilterWeek ="<div class='emot emotion-"+tweetEmotionWeekDefault+" week followers bayesian-classifier' ><div class='span2'><div class='emotion-icon'><dl class='palette palette-"+tweetEmotionWeekDefault+"'><dt>"+follower.name+"<dd>"+tweetEmotionWeekDefault+"</dd></dt></dl></div></div></div>";
//     var iconBayesianFilterMonth ="<div class='emot emotion-"+tweetEmotionMonthBayesian+" week followers bayesian-classifier' ><div class='span2'><div class='emotion-icon'><dl class='palette palette-"+tweetEmotionMonthBayesian+"'><dt>"+follower.name+"<dd>"+tweetEmotionMonthBayesian+"</dd></dt></dl></div></div></div>";
//     var iconDefaultFilterMonth ="<div class='emot emotion-"+tweetEmotionMonthDefault+" week followers bayesian-classifier' ><div class='span2'><div class='emotion-icon'><dl class='palette palette-"+tweetEmotionMonthDefault+"'><dt>"+follower.name+"<dd>"+tweetEmotionMonthDefault+"</dd></dt></dl></div></div></div>";
//     var iconBayesianFilterYear ="<div class='emot emotion-"+tweetEmotionYearBayesian+" week followers bayesian-classifier' ><div class='span2'><div class='emotion-icon'><dl class='palette palette-"+tweetEmotionYearBayesian+"'><dt>"+follower.name+"<dd>"+tweetEmotionYearBayesian+"</dd></dt></dl></div></div></div>";
//     var iconDefaultFilterYear ="<div class='emot emotion-"+tweetEmotionYearDefault+" week followers bayesian-classifier' ><div class='span2'><div class='emotion-icon'><dl class='palette palette-"+tweetEmotionYearDefault+"'><dt>"+follower.name+"<dd>"+tweetEmotionYearDefault+"</dd></dt></dl></div></div></div>";

//     console.log("Tweet Emotion Week: "+tweetEmotionWeekDefault);
//     console.log("Tweet EMotion Week Bayes: "+tweetEmotionWeekBayesian)

//     console.log("iconContainer before: "+iconContainer);

//     var $newItems = iconBayesianFilterWeek+iconDefaultFilterWeek+iconBayesianFilterMonth+iconDefaultFilterMonth+iconBayesianFilterYear+iconDefaultFilterYear;
//     console.log($newItems);
//     $('#small-icons').empty().append($newItems);
//   }


    // iconContainer.isotope( 'appended', $newItems )


//   function renderFollowerIcon(follower) {
//     var follower_emotion_week = follower.emotion_week;
//     var follower_emotion_month = follower.emotion_month;
//     var follower_emotion_year = follower.emotion_year;

//     if (follower.emotion_week==="uncertain") {
//       follower_emotion_week="Ambiguous";
//     }
//     else {
//       follower_emotion_week=follower.emotion_week;
//     }

//     if (follower.emotion_month==="uncertain") {
//       follower_emotion_month="Ambiguous";
//     }
//     else {
//       follower_emotion_month=follower.emotion_month;
//     }

//     if (follower.emotion_year==="uncertain") {
//       follower_emotion_year="Ambiguous";
//     }
//     else {
//       follower_emotion_year=follower.emotion_year;
//     }

//     console.log(follower.emotion_week);
//     console.log(follower_emotion_month);


//     $('#small-icons').innerHTML="<div class='emot emotion-"+follower.emotion_week+" week followers'><div class='span2'><div class='emotion-icon'><dl class='palette palette-"+follower.emotion_week+"'><dt>"+follower.name+"<dd>"+follower_emotion_week+"</dd></dt></dl></div></div></div>";
//     $('#small-icons').innerHTML="<div class='emot emotion-"+follower.emotion_month+" month followers'><div class='span2'><div class='emotion-icon'><dl class='palette palette-"+follower.emotion_month+"'><dt>"+follower.name+"<dd>"+follower_emotion_month+"</dd></dt></dl></div></div></div>";
//     $('#small-icons').innerHTML="<div class='emot emotion-"+follower.emotion_year+" year followers'><div class='span2'><div class='emotion-icon'><dl class='palette palette-"+follower.emotion_year+"'><dt>"+follower.name+"<dd>"+follower_emotion_year+"</dd></dt></dl></div></div></div>";
//   }


// });

$(function() {
	$('a[name=post_to_twitter]').click(function(e) {
    //Cancel the link behavior
    e.preventDefault();

    //Get the textarea's text
    var taText = $('textarea#myTextArea').val();

    //Example - Now add the text to a span tag inside the modal
    $("#myDiv span").text(taText);
	});

	$('.user-assessment-modal a').click(function(e) {
		e.preventDefault();
		var target = $(e.target);
		var id = target.data("tweet-id");

		initialEmotion = target.data("initial-emotion");  /// NEED AJAX CALL HERE!!!!
    newEmotion = null;
		var text = target.text();

		newEmotion=text.toLowerCase();

		$.ajax({
			data: {
				id: id,
				emotion: text
			},
			url: 'dashboard/update_machine_learner',
			type: 'POST',
			datatype: 'json',
			success: function(data) {
				setNewColor(data);
				setNewText(data);
			},
			error: function(data) {}
		});

		setNewColor = function(data) {

      // console.log("old emotion: "+initialEmotion)
      // console.log("new emotion: "+newEmotion);
			// $('#icon'+data[0].id).removeClass("emotion-"+initialEmotion).addClass("emotion-"+newEmotion);
   //    $('#icon_bayes'+data[0].id).removeClass("emotion-"+initialEmotion).addClass("emotion-"+newEmotion);
      $('dl#iconcolor'+data[0].id).addClass("palette-"+newEmotion);
      console.log($('dl#iconcolor'+data[0].id));
			$('dl#iconcolor'+data[0].id).removeClass("palette-"+initialEmotion);
      console.log($('dl#iconcolor'+data[0].id));
      $('dl#iconcolor_bayes'+data[0].id).addClass("palette-"+newEmotion);
      $('dl#iconcolor_bayes'+data[0].id).removeClass("palette-"+initialEmotion);
		};

		setNewText = function(data) {
			$('#icontext'+data[0].id).text(text);
      $('#icontext_bayes'+data[0].id).text(text);
		};

	});

});


