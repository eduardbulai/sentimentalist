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
		var text = target.text();
		if (text=="uncertain") {
			var var_emotion="ambiguous";
		}
		else {
			var var_emotion=text;
		}
		$.ajax({
			data: {
				id: id,
				emotion: text
			},
			url: 'dashboard/update_machine_learner',
			type: 'POST',
			datatype: 'json',
			success: function(data) {
				var element = document.getElementById(data[0].id);
				console.log(element);
				$('div#'+data[0].id).replaceWith("<div class='emot emotion-"+data[0].emotion.toLowerCase()+" week user' id='"+data[0].id+"'><div class='span2'><div class='emotion-icon'><a href='#evaluate_user_tweet_modal"+data[0].id+"' data-toggle='modal' role='button' name='evaluate_user_tweet'><dl class='palette palette-"+data[0].emotion.toLowerCase()+"'><dd>"+var_emotion+"</dd></dl></a></div></div></div>");
			},
			error: function(data) {}
		});

	});

});


