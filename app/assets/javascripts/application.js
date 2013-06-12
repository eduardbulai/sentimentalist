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


// isotope stuff

$(document).ready(init);

function init() {
    var things = $('#iconfield');
    filters = {timefilter: ".week"};

    things.isotope({ filter: '.week' });

    things.isotope({
        itemSelector : '.emot'
    });

    // when everything loads, make the "all" options selected
    $('.filter a[datafiltervalue=""]').addClass('selected');

    // filter buttons
    $('.filter a').click(
    function(e){
        e.preventDefault();
        var clicked_filter = $(this);

        // if the clicked link is already selected, don't do anything
        if ( clicked_filter.hasClass('selected') ) {
            return;
        }

        var optionSet = clicked_filter.parents('.option-set');

        // get rid of the ".selected" class on any links in this group and put it on the clicked link
        optionSet.find('.selected').removeClass('selected');
        clicked_filter.addClass('selected');

        // store the filters in the filters object, indexed by the group they're in
        // i.e. filters.category = 'animal'
        var group = optionSet.attr('datafiltergroup');
        filters[ group ] = clicked_filter.attr('datafilter');

        // convert the filters object into an array of strings which are CSS class selectors
        var filters_to_use = [];
        for ( var group in filters ) {
             filters_to_use.push( filters[ group ] );
        }

        // smash the array together to get a big selector which will filter all elements with the filter classes
        var selector = filters_to_use.join('');

        // run the filter on the isotope element
        things.isotope({ filter: selector });
    }
  );
}