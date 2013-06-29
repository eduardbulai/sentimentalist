//= require spec_helper

describe('updateBayesianProfileIcon()', function() {

  it("makes a getJSON request to the correct URL", function() {

    spyOn($, "getJSON");
    updateBayesianProfileIcon();
    expect($.getJSON).toHaveBeenCalledWith('/dashboard/update_profile_icon/', jasmine.any(Function));

  });

  it("renders new elements in the DOM", function() {

    loadFixtures("dashboard.html");

    var stuff = {'user': { 'bayesian_emotion': 'surprise' } };

    spyOn($, 'getJSON').andCallFake(function(url,response){ response(stuff); });
    updateBayesianProfileIcon();

    expect($.getJSON).wasCalled();
    expect($('dl')).toHaveClass('palette-surprise');

  });

});

// describe("setNewIcon(data)", function() {

//   it("makes an ajax request to the correct URL", function() {

//     loadFixtures("user_assessment_modal.html");

//     spyOn($, "ajax");
//     $('.user-assessment-modal a').trigger('click');
//     expect($.ajax).toHaveBeenCalledWith("dashboard/update_machine_learner", jasmine.any(Function));
//   });

// });

