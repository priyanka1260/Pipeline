/* $(function() {
    $('#toggle-two').bootstrapToggle({
      on: 'Yes',
      off: 'No'
    });
  })   
  $('##toggle-two').on( 'change', function() {
  alert('slid');
});*/
/*
function validation()
{
	  
	
	var number_of_badpix=document.getElementById("number_of_badpix").value;
    var input_badpix=document.getElementById("input_badpix").value;
    var output_badpix=document.getElementById("output_badpix").value;
    if(document.getElementById('yeshistory').checked)
    	{
		var history=document.getElementById('yeshistory').value;
         alert(history);
    	}
	else if(document.getElementById('nohistory').checked)
		{
		var history=document.getElementById('nohistory').value;
		alert(history);
		}
    if(document.getElementById('yeswrite').checked)
	{
	var write=document.getElementById('yeswrite').value;
     alert(write);
	}
else if(document.getElementById('nowrite').checked)
	{
	var write=document.getElementById('nowrite').value;
	alert(write);
	}

  

   var url="/Pipeline/cztflagbadpix?&number_of_badpix="+number_of_badpix+"&input_badpix="+input_badpix+"&output_badpix="+output_badpix+"&history="+history+"&write="+write; 
   alert(url);
   var xhttp = new XMLHttpRequest();

   
   xhttp.onreadystatechange = function() {
	  //if (this.readyState == 4 && this.status == 200) {
	   alert("state===="+this.readyState);
		alert("status=============="+this.status);
  // }
  
	   };

  xhttp.open("GET",url,true);
   xhttp.send();
}
 */

        /****************************************
         *       Basic Table                   *
         ****************************************/
  
        	    // The cell has stuff in it
        	
        $('#zero_config').DataTable();
        $('#zero_config1').DataTable();
      

        window.onload=function() {

        	   document.getElementById("hidden_elements").style.display="none";
        	   document.getElementById("hidden_elements1").style.display="none";

        	   
        	   var radios = document.forms[0].elements["group1"];
        	   for (var i = [0]; i < radios.length; i++)
        	     radios[i].onclick=radioClicked;
        	 }
        	 function radioClicked() {
        	  if (this.value == "level1") {
        	     document.getElementById("hidden_elements").style.display="block";
        	    } else {
        	     document.getElementById("hidden_elements").style.display="none";
        	    }
        	    if (this.value == "level2") {
        	     document.getElementById("hidden_elements1").style.display="block";
        	    } else {
        	     document.getElementById("hidden_elements1").style.display="none";
        	    }
        	 }