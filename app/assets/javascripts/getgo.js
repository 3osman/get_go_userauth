// #########################
// JavaScript file
//
// Project: getgo
// Author: Domonkos Horvath
// #########################

// jQuery to add shadow to navbar
$(window).scroll(function() {
    if ($(".navbar").offset().top > 1) {
        $(".navbar-fixed-top").addClass("scroll-shadow",  {duration:500});
    } else {
        $(".navbar-fixed-top").removeClass("scroll-shadow",  {duration:500});
    }
});

// Switch slider
(function($) {
    // Switch
	$("[data-toggle='switch']").bootstrapSwitch({baseClass: 'switch'});

	$('#top-toolbar').toolbar({
		content: '#user-toolbar-options',
		position: 'top'
	});

	$('#bottom-toolbar').toolbar({
		content: '#user-toolbar-options',
		position: 'bottom'
	});

	$('#vertical-top-toolbar').toolbar({
		content: '#user-toolbar-options',
		position: 'vertical-top'
	});

	$('#vertical-bottom-toolbar').toolbar({
		content: '#user-toolbar-options',
		position: 'vertical-bottom'
	});

})(jQuery);

// Bootstrap input select
$('.selectpicker').selectpicker();


// Roadmap finish subtask
$('.panel-title-btn').click(function(event) {
	event.stopPropagation();
	var parent = $(this).parent();
	if (parent.hasClass('done')) {
		parent.removeClass('done');
	} else {
		parent.addClass('done');
	}
	event.preventDefault();
});

// Roadmap adding personal comment

//Hide all comment fields
$('.add-comment').hide();

//Add comment
$('.add-comment-btn').click(function(e) {
	var parent = $(this).parent();
	parent.find('.add-comment').show();
	$(this).hide();
	e.preventDefault();
});

//Save comment
$('.comment-save').click(function(event) {
	var parent = $(this).parent();
	var comments_container = parent.parent().find('.comments-container');
	comments_container.append('\
		<div class="alert alert-warning alert-dismissable user-comment">\
		<button type="button" class="close fa-times fa" data-dismiss="alert" aria-label="Close"></button>\
        ' + parent.find('.form-control').val() + '</div>');
	parent.parent().find('.form-control').val('');
	parent.parent().find('.add-comment-btn').show();
	parent.hide();
});

//Cancel
$('.comment-cancel').click(function() {
	var parent = $(this).parent();
	parent.hide();
	parent.parent().find('.form-control').val('');
	parent.parent().find('.add-comment-btn').show();

});


//jquery same height
$('.tile-profile').matchHeight({
    byRow: true,
    property: 'height',
    target: null,
    remove: false
});

// Library roadmap filter
$('input[name="filter-roadmap"]').on('switchChange.bootstrapSwitch', function(event, state) {
  if (state == true) {
  	$('.roadmap-item').show(200);
  } else {
  	$('.roadmap-item').hide(200);
  }
});





