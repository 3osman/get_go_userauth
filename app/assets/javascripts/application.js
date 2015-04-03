// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require twitter/bootstrap
//= require bootstrap-select
//= require bootstrap-switch
//= require_tree .

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









