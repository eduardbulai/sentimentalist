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

  it("triggers and ajax request", function() {

    var id = 18;
    var text = "surprise";
    var newEmotion = "surprise";

    spyOn($, "ajax");
    updateMachineLearner(text, id, newEmotion);
    expect($.ajax).wasCalled();

  });

  it("ajax call changes icon color", function() {

    var fakeResponse = {"machine_learners":[{"machine_learners":{"bayesian_emotion":"disgust",
      "created_at":"2013-07-05T13:41:14Z","emotion":"disgust","id":18,"polarity":8,
      "text": "this is a tweet","tweet_id":"343538646105870336","updated_at":"2013-07-05T14:15:42Z",
      "user_id":1}}]};

    var id = 18;
    var text = "surprise";
    var newEmotion = "surprise";

    expect($('.emot.icon18')).toHaveClass('emotion-ambiguous');
    expect($('.emot.icon_bayes18')).toHaveClass('emotion-anger');
    expect($('dl#iconcolor18')).toHaveClass('palette-ambiguous');
    expect($('dl#iconcolor_bayes18')).toHaveClass('palette-anger');

    spyOn($, "ajax").andCallFake(function(params) {
      params.success(fakeResponse);
    });
    updateMachineLearner(text, id, newEmotion);

    expect($('.emot')).toHaveClass('emotion-surprise');
    expect($('dl#iconcolor18')).toHaveClass('palette-surprise');
    expect($('dl#iconcolor_bayes18')).toHaveClass('palette-surprise');

  });


  it("ajax call changes icon text", function() {

    var fakeResponse = {"machine_learners":[{"machine_learners":{"bayesian_emotion":"disgust",
      "created_at":"2013-07-05T13:41:14Z","emotion":"disgust","id":18,"polarity":8,
      "text": "this is a tweet","tweet_id":"343538646105870336","updated_at":"2013-07-05T14:15:42Z",
      "user_id":1}}]};
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

describe("deleteUserAccount();", function() {

  it("triggers  ajax request to the correct url", function(){

    var url = 'users/destroy';

    spyOn($, "ajax");
    deleteUserAccount();
    expect($.ajax.mostRecentCall.args[0]["url"]).toEqual(url);

  });

});


describe("resetBayesianClassifier()", function() {

  it("triggers an ajax request to the correct url", function(){

    var url = 'machine_learners/reset';

    spyOn($, "ajax");
    resetBayesianClassifier();
    expect($.ajax.mostRecentCall.args[0]["url"]).toEqual(url);

  });

});
