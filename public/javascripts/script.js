$(document).ready(function() {
	/* Add jquery ui tabs to Note Wizard */
	$("#note-tabs").tabs();
	
	/* Remove tabs from last list-item */
	$("#ftr-links li:last").css("border-right", "none");
});