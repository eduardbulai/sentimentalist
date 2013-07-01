//= require spec_helper

describe('updateBayesianProfileIcon()', function() {

  it("makes a getJSON request to the correct URL", function() {

    spyOn($, "getJSON");
    updateBayesianProfileIcon();
    expect($.getJSON).toHaveBeenCalledWith('/dashboard/update_profile_icon/', jasmine.any(Function));

  });

  it("renders new elements in the DOM", function() {

    loadFixtures("dashboard_user_profile_icon.html");

    expect($('dl')).toHaveClass('palette-anger');

    var stuff = {'user': { 'bayesian_emotion': 'surprise' } };

    spyOn($, 'getJSON').andCallFake(function(url,response){ response(stuff); });
    updateBayesianProfileIcon();

    expect($.getJSON).wasCalled();
    expect($('dl')).toHaveClass('palette-surprise');

  });

});


describe("change user_tweet emotion icon via modal", function() {

  beforeEach(function () {
    loadFixtures("dashboard_emotion_icon.html");
  });

  it("click triggers ajax request to the correct URL", function() {

    var id = 18;
    var text = "surprise";
    var newEmotion = "surprise";

    spyOn($, "ajax");
    updateMachineLearner(text, id, newEmotion);
    expect($.ajax).wasCalled();

  });

  it("click changes icon color", function() {

    var fakeResponse = [{"id": 18},{"bayesian_emotion": "disgust"},{"created_at": "2013-06-29T16:23:03Z"},
      {"emotion": "disgust"},{"polarity": 7},{"text": "this is a tweet"},
      {"tweet_id": "337283249111969792"},{"updated_at": "2013-06-30T01:13:22Z"},
      {"user_id": 1}];
    var id = 18;
    var text = "surprise";
    var newEmotion = "surprise";

    expect($('dl#iconcolor18')).toHaveClass('palette-ambiguous');
    expect($('dl#iconcolor_bayes18')).toHaveClass('palette-anger');

    spyOn($, "ajax").andCallFake(function(params) {
      params.success(fakeResponse);
    });
    updateMachineLearner(text, id, newEmotion);

    expect($('dl#iconcolor18')).toHaveClass('palette-surprise');
    expect($('dl#iconcolor_bayes18')).toHaveClass('palette-surprise');

  });


  it("click changes icon text", function() {

    var fakeResponse = [{"id": 18},{"bayesian_emotion": "disgust"},{"created_at": "2013-06-29T16:23:03Z"},
      {"emotion": "disgust"},{"polarity": 7},{"text": "this is a tweet"},
      {"tweet_id": "337283249111969792"},{"updated_at": "2013-06-30T01:13:22Z"},
      {"user_id": 1}];
    var text = "surprise";
    var id = 18;
    var newEmotion = "surprise";

    expect($('dd.icontext18')).toHaveText('ambiguous');
    expect($('dd.icontext_bayes18')).toHaveText('anger');

    spyOn($, 'ajax').andCallFake(function(params) {
      params.success(fakeResponse);
    });
    updateMachineLearner(text, id, newEmotion);

    expect($('.icontext18')).toHaveText('surprise');
    expect($('.icontext_bayes18')).toHaveText('surprise');

  });


});
