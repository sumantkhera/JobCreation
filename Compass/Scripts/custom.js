 $(document).ready(function(){
	 //Slide Move Right to Left//
     $("#estimate-btn").click(function(){
         $(".box").animate({
             width: "toggle"
         });
         $(".estimate-form").hide();
         $(".inner").css("width","38%");
         
     });
    
     
     //Select box in the form//
     $('.check-select').click(function() {
    	 var checkbox = $(this).find('input[type=checkbox]');
 	    if(checkbox.is(":checked")) {
   	    	$(this).addClass("active-check");
   	     	checkbox.prop("checked", 'checked');
   	    } else {
   	    	$(this).removeClass("active-check");
   	       checkbox.prop("checked", false);
   	    }
 	    
   	});
 });