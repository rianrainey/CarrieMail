$(document).ready(function() {
	/* Add jquery ui tabs to Note Wizard */
	$("#note-tabs").tabs();
	
	/* Remove tabs from last list-item */
	$("#ftr-links li:last").css("border-right", "none");
	
	/* Load Carrie Demo App */
	$("#step-1 a").colorbox({width:"70%", height:"80%", iframe:true, onclosed:function(){location.reload(true);}} );
	
	$('#relax-button a').live('click', function(){
	    parent.$.colorbox.close(); 
		return false;
	});	
	
});