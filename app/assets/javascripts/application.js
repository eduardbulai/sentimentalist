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
		var initial_emotion = target.data("initial-emotion");
		var text = target.text();
		if (text==="Ambiguous") {
			var var_emotion="uncertain";
		}
		else {
			var var_emotion=text.toLowerCase();
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
				setNewColor(data);
				setNewText(data);
			},
			error: function(data) {}
		});

		setNewColor = function(data) {
			$('#icon'+data[0].id).removeClass("emotion-"+initial_emotion).addClass("emotion-"+var_emotion);
			$('dl.palette.'+data[0].id).removeClass("palette-"+initial_emotion).addClass("palette-"+var_emotion);
		};

		setNewText = function(data) {
			$('#icontext'+data[0].id).text(text);
		};

	});

});


