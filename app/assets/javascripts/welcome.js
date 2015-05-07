// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

jQuery(function($){

	$.supersized({

		// Functionality
		slide_interval          :   4000,		// Length between transitions
		transition              :   1, 			// 0-None, 1-Fade, 2-Slide Top, 3-Slide Right, 4-Slide Bottom, 5-Slide Left, 6-Carousel Right, 7-Carousel Left
		transition_speed		:	1400,		// Speed of transition

		// Components
		slide_links				:	'blank',	// Individual links for each slide (Options: false, 'num', 'name', 'blank')
		new_window				:	0,
		slides 					:  	[			// Slideshow Images
											{image : 'https://s3.amazonaws.com/sveltewebsite/home_background_1.JPG', url : '#' },
											{image : 'https://s3.amazonaws.com/sveltewebsite/home_background_2.JPG', url : '#' },
											{image : 'https://s3.amazonaws.com/sveltewebsite/home_background_3.jpeg', url : '#' },
											{image : 'https://s3.amazonaws.com/sveltewebsite/home_background_4.jpeg', url : '#' }
									]

	});
});
