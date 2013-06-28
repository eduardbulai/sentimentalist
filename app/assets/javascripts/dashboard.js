$(document).ready(function() {
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

      console.log($('dl#iconcolor'+data[0].id));
      $('dl#iconcolor'+data[0].id).removeClass();
      $('dl#iconcolor'+data[0].id).addClass("palette palette-"+newEmotion);
      console.log($('dl#iconcolor'+data[0].id));
      $('dl#iconcolor_bayes'+data[0].id).removeClass();
      $('dl#iconcolor_bayes'+data[0].id).addClass("palette palette-"+newEmotion);
    };

    setNewText = function(data) {
      $('#icontext'+data[0].id).text(text);
      $('#icontext_bayes'+data[0].id).text(text);
    };

  });

});
