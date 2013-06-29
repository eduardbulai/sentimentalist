$(document).ready(function() {
  $('a[name=post_to_twitter]').click(function(e) {
    e.preventDefault();

    var taText = $('textarea#myTextArea').val();

    $("#myDiv span").text(taText);
  });

  $('.user-assessment-modal a').click(function(e) {
    e.preventDefault();
    var target = $(e.target);
    var id = target.data("tweet-id");

    initialEmotion = target.data("initial-emotion");
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

      $('dl#iconcolor'+data[0].id).removeClass();
      $('dl#iconcolor'+data[0].id).addClass("palette palette-"+newEmotion);
      $('dl#iconcolor_bayes'+data[0].id).removeClass();
      $('dl#iconcolor_bayes'+data[0].id).addClass("palette palette-"+newEmotion);
    };

    setNewText = function(data) {
      $('#icontext'+data[0].id).text(text);
      $('#icontext_bayes'+data[0].id).text(text);
    };

  });

  updateBayesianProfileIcon();

});


function updateBayesianProfileIcon() {
  $.getJSON('/dashboard/update_profile_icon/', function(response) {

    bayesianEmotion = response.user.bayesian_emotion;

    console.log(response);

    desktopTarget = $('#desktop-profile-icon div.iconfield div.user.bayesian-classifier dl');
    mobileTarget = $('#mobile-profile-icon div.iconfield div.user.bayesian-classifier dl');

    desktopTarget.removeClass();
    desktopTarget.addClass("palette-user-profile palette-"+bayesianEmotion);
    $('#desktop-profile-icon div div.user.bayesian-classifier dl dt').text(bayesianEmotion);
    mobileTarget.removeClass();
    mobileTarget.addClass("palette-user-profile palette-"+bayesianEmotion);
    $('#mobile-profile-icon div div.user.bayesian-classifier dl dt').text(bayesianEmotion);

    setTimeout(updateBayesianProfileIcon, 1000);

  });
}
