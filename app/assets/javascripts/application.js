// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

$(function() {
  $('.menu-trigger').on('click', function(event) {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    event.preventDefault();
  });
});

$(function() {
	function readURL(input) {
	    if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function (e) {
	$('#img_prev').attr('src', e.target.result);
	    }
	    reader.readAsDataURL(input.files[0]);
	    }
	}
	$("#user_img").change(function(){
	    readURL(this);
	});
});

$(function() {
	function readURL(input) {
	    if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function (e) {
	$("#post_img_prev").attr('src', e.target.result);
	    }
	    reader.readAsDataURL(input.files[0]);
	    }
	}
	$("#post_img").change(function(){
	    readURL(this);
	});
});

$(function() {
	function readURL(input) {
	    if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function (e) {
	$("#post_video_prev").attr('src', e.target.result);
	    }
	    reader.readAsDataURL(input.files[0]);
	    }
	}
	$("#post_video").change(function(){
	    readURL(this);
	});
});