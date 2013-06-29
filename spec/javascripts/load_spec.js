//= require spec_helper

describe('loadRequest()', function() {

  it("makes a getJSON request to the correct URL", function() {

    spyOn($, "getJSON");
    loadRequest();
    expect($.getJSON).toHaveBeenCalledWith('/dashboard/index/', jasmine.any(Function));

  });

});
