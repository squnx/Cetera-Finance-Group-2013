/* Expiring content: based on datetime attribute encapsulated by <ins> tags
 * created 10/08/2009
 * Used in combination with SlideViewer
 *	Alfresco ID: 1064404
 *	Update: 05/02/2012
 */
$(function(){

	var colDate = new Array();
	var todai = new Date();
	var expDates = new Array();
	var j = 0;
	
	//loop through list and push all dates into array colDate
	for(var i = 0; i < $("#ingSlider li").length; i++){
		var insAttr = $($("#ingSlider ins")[i]).attr("datetime");
		colDate[i] = insAttr;
	}
	/* convert colDate array data into dates and in seconds
	 * compare this dates with today's date, if older push into expDates array
	 */
	for(var h = 0; h < colDate.length; h++){
	var comp = new Date(colDate[h]);
	var compSec = comp.getTime();
	var todaiSec = todai.getTime();
	
		if (compSec <= todaiSec){
		expDates[j++] = compSec;
		}
	}
	/* convert expDates array data into seconds and compare with each 
	 * "datetime" value, repeat for next expiration date and so on
	 */
	for(var g = 0; g < expDates.length; g++){	
		var expDate = expDates[g];
		var insList = $("#ingSlider ins");
	
		for(var f = 0; f < insList.length; f++){
			var allDates = new Date($($("#ingSlider ins")[f]).attr("datetime"));
			var allDatesSec = allDates.getTime();
		 
			if ( expDate == allDatesSec){
				$($("#ingSlider li")[f]).remove();
			}	
		}
	}
});