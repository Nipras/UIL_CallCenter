<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.Date"%>    
<%@ page language="java" import="java.text.SimpleDateFormat"%>
    <%
String path=request.getContextPath();
    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");  
    Date today = new Date();  
%> 


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Entry</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/CSS/create.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
function Show(obj){
	var currCellIndx = obj.cellIndex;
	var x = document.getElementById("menu").rows[0].cells;    
	for(i=0;i<=7;i++){
		if($('#desk_type').val() == 'In-Bound') {
			var idx = i + "ibd" ;		
			var ele = document.getElementById(idx);
			if(i == currCellIndx){			
				 x[i].style.backgroundColor = "#c1c1c1" ;	
				 
				ele.style.display = "block";
			}else{
				 x[i].style.backgroundColor = "#01ee01" ;
				
				ele.style.display = "none";
			} 
		}else{
			var idx = i + "obd" ;		
			var ele = document.getElementById(idx);
			if(i == currCellIndx){			
				 x[i].style.backgroundColor = "#c1c1c1" ;	
				 
				ele.style.display = "block";
			}else{
				 x[i].style.backgroundColor = "#01ee01" ;
				
				ele.style.display = "none";
			}
		}
	}
	
}
function fetch(event){
	{
		if (event.keyCode == 13 ){	        
           $.ajax({                        
              url:"fetch.jsp",
              type: "Get",
              data: {input : $('#cenId').val()},
              dataType:"json",
              success:function(res){            	       
                      for(i=0;i<res.length;i++){                    	
                         document.getElementById("aname").value = res[0].Name;
                         document.getElementById("tl").value = res[0].Tl;
                      }        
              },
              error:function() {
                    alert("error occurred");
              }
           });
   }
	}
}

$(document).ready(function(){
  //  $("#call_time").timepicker({}); 
     var createForm = $('#callAuditForm');  
     $("#desk_type").change(function(){
    	 
    	 if(this.value == 'In-Bound'){
    		 $("#ibd").show();
    		 $("#obd").hide();
    	 }else{
    		 $("#obd").show();
    		 $("#ibd").hide();
    	 }
     });
     $(".btn_submit").click(function (event) {
    	 event.preventDefault();
    	 $.ajax({
    		  url: '<%=path %>/SubmitData',
    		  method: 'POST',
    		  data: createForm.serialize(),
    		  success: function (res) {    			 
    			  if(res == 'Y'){    		
    			  $("#msg").removeClass("error"); 
    			  $("#msg").addClass("success");
    		      $("#msg").html("Record Inserted Successfully");    		      
    		  }else{ 
    			  $("#msg").removeClass("success");
    			  $("#msg").addClass("error"); 
    		      $("#msg").html("Record Could not be inserted"); 
    		        
    		  }
    		  } ,
    		  error: function(){
    			  alert("Database Could not be connected");
    		  }
    		});
    	
    	
    });
    
    
    
});
    
</script>
</head>
<body style="background-color:#fff">
<div class="header" />
</span><span>UIL Call Center Quality Management Portal </span> <span style="float:right">Welcome ${name}</span>
</div>
<div class="header_txt">
Call Monitoring Form <span id="msg" ></span><span style="float:right"><a href="Welcome.jsp">Home Page</a></span>
</div>
<form id="callAuditForm">
<div class="data-container" >
	<table class="hdr_tbl">
				<tr>
					<td>Zcentrix ID</td><td> <input type="text" name="zcentrixid" id="cenId" onkeypress="fetch(event)"/></td>
					<td>Name:</td><td> <input type="text" name="an" id="aname" disabled/></td>
					<td>TL:</td><td> <input type="text" name="tl" id="tl" disabled/></td>
					<td>Date of Activity:</td><td> <input type="text" name="doa" disabled value="<%= formatter.format(today) %>"/></td>	
					
								  			
				</tr>
				<tr >	
				   <td>Call Type </td><td><select type="text" name="call_type" />
									<option>Service Request</option><option>Follow Up</option><option>Query</option>
								  </select> </td>			
					<td>Campaign:</td><td> <input type="text" name="campaign" /></td>
					<td>Desk Type:</td><td> <select type="text" name="desk_type" id="desk_type"/>
										<option>In-Bound</option><option>Out-Bound</option>
									</select> </td>
					<td>Complain Id:</td><td> <input type="text" name="complain_id" /></td>
					
				</tr>
				<tr>				
					<td>Contact#: </td><td><input type="text" name="contact" id="contact_num"/></td>
					<td>Call Date </td><td><input type="text" name="call_date" id="call_date"/></td>				
					<td>Call Duration</td> <td><input type="text" name="call_dur" id="call_duration"/></td>	
					<td>Product:</td><td> <select name="product"  id="product">
	    										 <option value="">--Select Product--</option>
	    										 <option value="">Agro</option>    										
	    										 <option value="">Cooking Appliance</option>
	    										 <option value="">Courtesy Visit</option>
	    										 <option value="">Demo</option>
	    										 <option value="">Diesel Engine</option>
	    										 <option value="">Electric Fan</option>
	    										 <option value="">Fabric Care Appliances</option>
	    										 <option value="">Home Comfort</option>
	    										 <option value="">Home UPS</option>
	    										 <option value="">Hooods & Hobs</option>
	    										 <option value="">Lighting</option>
	    										 <option value="">EWP</option>
	    										 <option value="">Sewing Machines</option>
	    										  <option value="">Water Solutions</option>
	    									</select> </td>			
				</tr>
			</table>
		
			<table  class="menu_tbl" id="menu">
			<tr>
			<td onclick='Show(this)'style="background-color:#c1c1c1;">Call Opening</td>
			<td onclick='Show(this)'>Call Purpose</td>
			<td onclick='Show(this)'>Communication Skill</td>
			<td onclick='Show(this)'>Customer Handling</td>
			<td onclick='Show(this)'>Product and Process Knowledge</td>
			<td onclick='Show(this)'>Documentation</td>
			<td onclick='Show(this)'>Call Closing</td>
			<td onclick='Show(this)'>Fatal Parameters</td>
			</tr>
			</table>
			<div id="ibd" >
				<table id="0ibd" style="display:block;"  class="menuDtl_tbl" >
					<tr>
						<td width="40%">Late Opening</td>
						<td width="5%"><input type="radio" name="0ai" value="Yes" checked /></td>
						<td width="10%">Yes</td>
						<td width="5%"><input type="radio" name="0ai" value="No"></td>
						<td> No</td>
					</tr>
					<tr>
						<td >Did the CSR used correct greeting?</td>
						<td><input type="radio" name="0bi" value="1" checked></td>
						<td>1</td>
						<td><input type="radio" name="0bi" value="0"></td>
						<td> 0</td>
					</tr>
				<tr>
				<td >Did the CSR mention the company name?</td>
				<td><input type="radio" name="0ci" value="1" checked></td>
						<td>1</td>
						<td><input type="radio" name="0ci" value="0"></td>
						<td> 0</td>
				</tr>
				<tr>
				<td >Did the CSR mention his/ her name?</td>
				<td><input type="radio" name="0di" value="1" checked></td>
						<td>1</td>
						<td><input type="radio" name="0di" value="0"></td>
						<td> 0</td>
				</tr>
				</table>
				<table id="1ibd" style="display:none" class="menuDtl_tbl">
				<tr>
				<td>Effective and necessary probing done on call </td>
				<td><input type="radio" name="1ai" value="10" checked></td>
						<td>10</td>
						<td><input type="radio" name="1ai" value="0"></td>
						<td> 0</td>
				
				<tr>
				<td>Did CSR adhered to the call structure as per CRM? </td>
				<td><input type="radio" name="1bi" value="5" checked></td>
						<td>5</td>
						<td><input type="radio" name="1bi" value="0"></td>
						<td> 0</td>
				</td>
				</tr>
				</table>
				<table id="2ibd" style="display:none" class="menuDtl_tbl">
				<tr>
				<td>Voice reflected energy,  interest and willingness to assist the customer</td>
				<td><input type="radio" name="2ai" value="7" checked></td>
						<td>7</td>
						<td><input type="radio" name="2ai" value="0"></td>
						<td> 0</td>
				</tr>
				<tr>
				<td>Did the CSR refrain from using jargon throughout the call and maintained proper rate of speech?</td>
				<td><input type="radio" name="2bi" value="5" checked></td>
						<td>5</td>
						<td><input type="radio" name=2bi" value="0"></td>
						<td> 0</td>
				</tr>
				<tr>
					<td>Did the CSR sound polite, used appropriate tone and sound professional?</td>
					<td><input type="radio" name="2ci" value="5" checked></td>
					<td>5</td>
					<td><input type="radio" name="2ci" value="0"></td>
					<td> 0</td>
				</tr>
				</table>
				<table id="3ibd" style="display:none" class="menuDtl_tbl">
				<tr>
					<td>Avoided long silence (more than 15 secs)</td>
					<td><input type="radio" name="3ai" value="5" checked></td>
					<td>5</td>
					<td><input type="radio" name="3ai" value="0"></td>
					<td>0</td>
				</tr>
				<tr>
				     <td>Did the CSR demonstrate active listening?</td>
					<td><input type="radio" name="3bi" value="5" checked></td>
					<td>5</td>
					<td><input type="radio" name="3bi" value="0"></td>
					<td> 0</td>
				</tr>
				<tr>
				<td>Did the CSR showed empathy when required?</td>
				<td><input type="radio" name="3ci" value="5" checked></td>
					<td>5</td>
					<td><input type="radio" name="3ci" value="0"></td>
					<td> 0</td>
				</tr>
				<tr>
				<td>Did CSR Properly used mute button and apologized when required?</td>
				<td><input type="radio" name="3di" value="5" checked></td>
					<td>5</td>
					<td><input type="radio" name="3di" value="0"></td>
					<td> 0</td>
				</tr>
				<tr>
				<td>Was hold required and  process adhered to?</td>
				<td><input type="radio" name="3ei" value="5" checked></td>
					<td>5</td>
					<td><input type="radio" name="3ei" value="0"></td>
					<td> 0</td>
				</tr>
				<tr>
					<td>Did the CSR interrupt or talk over the customer?</td>
					<td><input type="radio" name="3fi" value="5" checked></td>
					<td>5</td>
					<td><input type="radio" name="3fi" value="0"></td>
					<td> 0</td>
				</tr>
				</table>
				<table id="4ibd" style="display:none"  class="menuDtl_tbl">
				<tr>
				<td width="40%" nowrap>Did the CSR have adequate product & Process knowledge to answer the customer/dealer call?</td>
				<td width="3%"><input type="radio" name="4ai" value="7" checked></td>
					<td width="5%">7</td>
					<td width="3%"><input type="radio" name="4ai" value="0"></td>
					<td> 0</td>
				<tr>
				<td>Proper scripts and procedures followed on call?</td>
				<td><input type="radio" name="4bi" value="3" checked></td>
					<td>3</td>
					<td><input type="radio" name="4bi" value="0"></td>
					<td> 0</td>
				</tr>
				<tr>
				<td>Did the CSR provide  unnecessary information to customer where not required?</td>
				<td><input type="radio" name="4ci" value="5" checked></td>
					<td>5</td>
					<td><input type="radio" name="4ci" value="0"></td>
					<td> 0</td>
				</tr>
				<tr>
				<td>Did the CSR enquired and informed about documents required and charges applicable as per process?</td>
				<td><input type="radio" name="4di" value="7" checked></td>
					<td>7</td>
					<td><input type="radio" name="4di" value="0"></td>
					<td> 0</td>
				</tr>
				</table>
				<table id="5ibd" style="display:none" class="menuDtl_tbl">
				<tr>
				<td>Was tagging done properly and completely as per process?</td>
				<td><input type="radio" name="5ai" value="10" checked></td>
					<td>10</td>
					<td><input type="radio" name="5ai" value="0"></td>
					<td> 0</td>
				</tr>
				</table>
				<table id="6ibd" style="display:none" class="menuDtl_tbl">
				<tr>
				<td>Did the CSR close the call in an appropriate manner?</td>
				<td><input type="radio" name="6ai" value="3" checked></td><td>3</td>
				 <td><input type="radio" name="6ai" value="0"></td><td>0</td>
				</tr>
				</table>
				<table id="7ibd" style="display:none" class="menuDtl_tbl">
				<tr>
				<td>Did CSR not escalated the call where required? </td>
				<td><input type="radio" name="7ai" value="Yes" ></td>
				<td>Yes</td>
				<td><input type="radio" name="7ai" value="No"checked>
				<td>No</td>
				</tr>
				<tr>
				<td>Did the CSR shared incorrect information? </td>
				<td><input type="radio" name="7bi" value="Yes" ></td>
				<td>Yes</td>
				<td><input type="radio" name="7bi" value="No"checked>
				<td>No</td>
				</tr>
				<tr>
				<td>Was the CSR rude or impolite on call?</td>
				<td><input type="radio" name="7ci" value="Yes" ></td>
				<td>Yes</td>
				<td><input type="radio" name="7ci" value="No"checked>
				<td>No</td>
				</tr>
				<tr>
				<td>Was the documentation done incorrectly?</td>
				<td><input type="radio" name="7di" value="Yes" ></td>
				<td>Yes</td>
				<td><input type="radio" name="7di" value="No"checked>
				<td>No</td>
				</tr>
				</table>
			</div>
			<div id="obd" style="display:none">
				<table id="0obd" style="display:block;"  class="menuDtl_tbl" >
					<tr>
						<td width="40%">Late Opening</td>
						<td width="5%"><input type="radio" name="0ao" value="Yes" checked /></td>
						<td width="10%">Yes</td>
						<td width="5%"><input type="radio" name="0ao" value="No"></td>
						<td> No</td>
					</tr>
					<tr>
						<td >Did the CSR used correct greeting?</td>
						<td><input type="radio" name="0bo" value="1" checked></td>
						<td>1</td>
						<td><input type="radio" name="0bo" value="0"></td>
						<td> 0</td>
					</tr>
				<tr>
				<td >Did the CSR mention the company name?</td>
				<td><input type="radio" name="0co" value="1" checked></td>
						<td>1</td>
						<td><input type="radio" name="0co" value="0"></td>
						<td> 0</td>
				</tr>
				<tr>
				<td >Did the CSR mention his/ her name?</td>
				<td><input type="radio" name="0do" value="1" checked></td>
						<td>1</td>
						<td><input type="radio" name="0do" value="0"></td>
						<td> 0</td>
				</tr>
				</table>
				<table id="1obd" style="display:none" class="menuDtl_tbl">
				<tr>
				<td width="40%">Did the CSR identified whether he is speaking to RPC / TPC ?</td>
				<td width="5%"><input type="radio" name="1ao" value="3" checked></td>
						<td width="5%">3</td>
						<td width="5%"><input type="radio" name="1ao" value="0"></td>
						<td > 0</td>
				</tr>
				<tr>
				<td>Did CSR explained the purpose of the call?</td>
				<td><input type="radio" name="1bo" value="3" checked></td>
						<td>3</td>
						<td><input type="radio" name="1bo" value="0"></td>
						<td> 0</td>
				</td>
				</tr>
				<tr>
				<td>Did CSR Seeked permission from customer(CSI/DSI)?</td>
				<td><input type="radio" name="1co" value="3" checked></td>
						<td>3</td>
						<td><input type="radio" name="1co" value="0"></td>
						<td> 0</td>
				</td>
				</tr>
				<tr>
				<td wrap>Did CSR completed necessary probing on call and Agent followed the Sequence of CSI or DSI question as per the process?</td>
				<td><input type="radio" name="1do" value="6" checked></td>
						<td>6</td>
						<td><input type="radio" name="1do" value="0"></td>
						<td> 0</td>
				</td>
				</tr>
				</table>
				<table id="2obd" style="display:none" class="menuDtl_tbl">
				<tr>
				<td>Voice reflected energy,  interest and willingness to assist the customer</td>
				<td><input type="radio" name="2ao" value="7" checked></td>
						<td>7</td>
						<td><input type="radio" name="2ao" value="0"></td>
						<td> 0</td>
				</tr>
				<tr>
				<td>Did the CSR refrain from using jargon throughout the call and maintained proper rate of speech?</td>
				<td><input type="radio" name="2bo" value="5" checked></td>
						<td>5</td>
						<td><input type="radio" name=2bo" value="0"></td>
						<td> 0</td>
				</tr>
				<tr>
					<td>Did the CSR sound polite, used appropriate tone and sound professional?</td>
					<td><input type="radio" name="2co" value="5" checked></td>
					<td>5</td>
					<td><input type="radio" name="2co" value="0"></td>
					<td> 0</td>
				</tr>
				</table>
				<table id="3obd" style="display:none" class="menuDtl_tbl">
				<tr>
					<td>Avoided long silence (more than 15 secs)</td>
					<td><input type="radio" name="3ao" value="5" checked></td>
					<td>5</td>
					<td><input type="radio" name="3ao" value="0"></td>
					<td>0</td>
				</tr>
				<tr>
				     <td>Did the CSR demonstrate active listening?</td>
					<td><input type="radio" name="3bo" value="5" checked></td>
					<td>5</td>
					<td><input type="radio" name="3bo" value="0"></td>
					<td> 0</td>
				</tr>
				<tr>
				<td>Did the CSR showed empathy when required?</td>
				<td><input type="radio" name="3co" value="5" checked></td>
					<td>5</td>
					<td><input type="radio" name="3co" value="0"></td>
					<td> 0</td>
				</tr>
				<tr>
				<td>Did CSR Properly used mute button and apologized when required?</td>
				<td><input type="radio" name="3do" value="5" checked></td>
					<td>5</td>
					<td><input type="radio" name="3do" value="0"></td>
					<td> 0</td>
				</tr>
				<tr>
				<td>Was hold required and  process adhered to?</td>
				<td><input type="radio" name="3eo" value="5" checked></td>
					<td>5</td>
					<td><input type="radio" name="3eo" value="0"></td>
					<td> 0</td>
				</tr>
				<tr>
					<td>Did the CSR interrupt or talk over the customer?</td>
					<td><input type="radio" name="3fo" value="5" checked></td>
					<td>5</td>
					<td><input type="radio" name="3fo" value="0"></td>
					<td> 0</td>
				</tr>
				</table>
				<table id="4obd" style="display:none"  class="menuDtl_tbl">
				<tr>
				<td width="40%" nowrap>Did the CSR have adequate product & Process knowledge to answer the customer/dealer call?</td>
				<td width="3%"><input type="radio" name="4ao" value="5" checked></td>
					<td width="5%">5</td>
					<td width="3%"><input type="radio" name="4ao" value="0"></td>
					<td> 0</td>
				<tr>
				<td>Proper sequence and procedures followed on call?</td>
				<td><input type="radio" name="4bo" value="10" checked></td>
					<td>10</td>
					<td><input type="radio" name="4bo" value="0"></td>
					<td> 0</td>
				</tr>
				<tr>
				<td>Did the agent provide complete and accurate information to the customer?</td>
				<td><input type="radio" name="4co" value="5" checked></td>
					<td>5</td>
					<td><input type="radio" name="4co" value="0"></td>
					<td> 0</td>
				</tr>
				<tr>
				</table>
				<table id="5obd" style="display:none" class="menuDtl_tbl">
				<tr>
				<td>Was tagging done properly and completely as per process?</td>
				<td><input type="radio" name="5ao" value="10" checked></td>
					<td>10</td>
					<td><input type="radio" name="5ao" value="0"></td>
					<td> 0</td>
				</tr>
				</table>
				<table id="6obd" style="display:none" class="menuDtl_tbl">
				<tr>
				<td>Did the CSR close the call in an appropriate manner?</td>
				<td><input type="radio" name="6ao" value="5" checked></td><td>5</td>
				 <td><input type="radio" name="6ao" value="0"></td><td>0</td>
				</tr>
				</table>
				<table id="7obd" style="display:none" class="menuDtl_tbl">
				<tr>
				<td>Did CSR not escalated the call where required? </td>
				<td><input type="radio" name="7ao" value="Yes" ></td>
				<td>Yes</td>
				<td><input type="radio" name="7ao" value="No"checked>
				<td>No</td>
				</tr>
				<tr>
				<td>Did the CSR shared incorrect information? </td>
				<td><input type="radio" name="7bo" value="Yes" ></td>
				<td>Yes</td>
				<td><input type="radio" name="7bo" value="No"checked>
				<td>No</td>
				</tr>
				<tr>
				<td>Was the CSR rude or impolite on call?</td>
				<td><input type="radio" name="7co" value="Yes" ></td>
				<td>Yes</td>
				<td><input type="radio" name="7co" value="No"checked>
				<td>No</td>
				</tr>
				<tr>
				<td>Was the documentation done incorrectly?</td>
				<td><input type="radio" name="7do" value="Yes" ></td>
				<td>Yes</td>
				<td><input type="radio" name="7do" value="No"checked>
				<td>No</td>
				</tr>
				</table>
			</div> 
</div>			
<div class="btn_submit" id="submit" >
Submit
</div>

<!--  <input type="text" value="Submit" class="btn_submit" />-->
</form>
</body>
</html>