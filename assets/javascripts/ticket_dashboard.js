jQuery.noConflict();
jQuery(function(){
	jQuery(".result-table").fixedHeaderTable({
		fixedColumn: true, 
		height: jQuery(window).height() - jQuery(".table-holder").position().top - jQuery("#footer").height()
	});

});
