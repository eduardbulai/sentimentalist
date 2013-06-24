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
//= require jquery
//= require jquery_ujs
//= require_tree .

// $(document).ready( function() {

//   function myRequest() {
//     $.getJSON('/dashboard/index/', function(user) {

//       $.each(user.user_tweets, function() {
//         renderUserIcon(this);
//       });

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

//   function renderUserIcon(tweet) {
//     var tweet_emotion = tweet.emotion;

//     if (tweet.emotion==="uncertain") {
//       tweet_emotion="Ambiguous";
//     }
//     else {
//       tweet_emotion=tweet.emotion;
//     }
//     $('#small-icons').innerHTML="<div class='emot emotion-"+tweet.emotion+" week user' id='icon"+tweet.id+"' ><div class='span2'><div class='emotion-icon'><a data-toggle='modal' href='#evaluate_user_tweet_modal"+tweet.id+"' id='link_to_evaluate_user_tweet_modal"+tweet.id+"' name='evaluate_user_tweet' role='button'><dl class='palette "+tweet.id+" palette-"+tweet.emotion+"'><dd id='icontext"+tweet.id+"'>"+tweet_emotion+"</dd></dl></a></div></div></div>";
//   }

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

// $(function() {
// 	$('a[name=post_to_twitter]').click(function(e) {
//     //Cancel the link behavior
//     e.preventDefault();

//     //Get the textarea's text
//     var taText = $('textarea#myTextArea').val();

//     //Example - Now add the text to a span tag inside the modal
//     $("#myDiv span").text(taText);
// 	});

// 	$('.user-assessment-modal a').click(function(e) {
// 		e.preventDefault();
// 		var target = $(e.target);
// 		var id = target.data("tweet-id");
// 		var initial_emotion = target.data("initial-emotion");
//     var var_emotion = null;
// 		var text = target.text();

// 		if (text==="Ambiguous") {
// 			var_emotion="uncertain";
// 		}
// 		else {
// 			var_emotion=text.toLowerCase();
// 		}

// 		$.ajax({
// 			data: {
// 				id: id,
// 				emotion: text
// 			},
// 			url: 'dashboard/update_machine_learner',
// 			type: 'POST',
// 			datatype: 'json',
// 			success: function(data) {
// 				setNewColor(data);
// 				setNewText(data);
// 			},
// 			error: function(data) {}
// 		});

// 		setNewColor = function(data) {
// 			$('#icon'+data[0].id).removeClass("emotion-"+initial_emotion).addClass("emotion-"+var_emotion);
// 			$('dl.palette.'+data[0].id).removeClass("palette-"+initial_emotion).addClass("palette-"+var_emotion);
// 		};

// 		setNewText = function(data) {
// 			$('#icontext'+data[0].id).text(text);
// 		};

// 	});

// });


