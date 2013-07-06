$(document).ready(function() {

  $('a.confirm-delete').click(function() {
    deleteUserAccount();
  });

  $('a.confirm-reset').click(function() {
    resetBayesianClassifier();
  });


  $('.user-assessment-modal a').click(function(e) {
    e.preventDefault();
    var target = $(e.target);
    var id = target.data("tweet-id");

    initialEmotion = target.data("initial-emotion");
    newEmotion = null;
    var text = target.text();

    newEmotion=text.toLowerCase();

    updateMachineLearner(text, id, newEmotion, initialEmotion);

  });

  updateBayesianProfileIcon();

});

function deleteUserAccount() {
  $.ajax({
    data: {},
    url: 'users/destroy',
    type: 'DELETE',
    datatype: 'json',
    success: function(){
      window.location='/';
    },
    error: function(){}
  });
}

function resetBayesianClassifier() {
  $.ajax({
    data:{},
    url: 'machine_learners/reset',
    type: 'POST',
    datatype: 'json',
    success: function(){
      window.location='/dashboard';
    },
    error: function() {}
  });
}


function updateBayesianProfileIcon() {
  $.getJSON('/dashboard/update_profile_icon/', function(response) {

    bayesianEmotion = response.user.bayesian_emotion;

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

function updateMachineLearner(text, id, newEmotion, initialEmotion) {
  $.ajax({
    data: {
      id: id,
      emotion: text
    },
    url: 'machine_learners/update',
    type: 'POST',
    datatype: 'json',
    success: function(data) {
      removeInitialEmotion($('.icon'+id));
      removeInitialEmotion($('.icon_bayes'+id));
      setNewColor(data);
      setNewText(data);
    },
    error: function(data) {}
  });

  setNewColor = function(data) {
    var id = data.machine_learners[0].machine_learners.id;
    $('.icon'+id).addClass('emotion-'+newEmotion);
    $('.icon_bayes'+id).addClass('emotion-'+newEmotion);
    $('dl#iconcolor'+id).removeClass();
    $('dl#iconcolor'+id).addClass("palette palette-"+newEmotion);
    $('dl#iconcolor_bayes'+id).removeClass();
    $('dl#iconcolor_bayes'+id).addClass("palette palette-"+newEmotion);
    };

  setNewText = function(data) {
    var id = data.machine_learners[0].machine_learners.id;
    $('.icontext'+id).text(text);
    $('.icontext_bayes'+id).text(text);
  };

  removeInitialEmotion = function(element) {
    var classes = element.attr('class').split(/\s+/);
    var pattern = /(\emotion-\w+)/;
    for (var i = 0; i < classes.length; i++){
      var className = classes[i];

      if(className.match(pattern)){
        element.removeClass(className);
      }
    }
  };

}
