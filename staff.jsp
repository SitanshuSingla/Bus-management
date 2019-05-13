<%@page import="org.hibernate.Query"%>
<%@page import="java.util.Iterator"%>
<%@page import="modal.admitadd"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html xmlns="http://www.w3.org/1999/xhtml" >
    <head>
        <title>TODO supply a title</title>
        <style>
            body
            {
                margin:0;
            }
            .im{
                float:left;
            }
            a{
                text-decoration: none;
                
            }
            a:visited
            {
                color:white;
            }
            a:link{
                color:white;
            }
            .main
            {
                margin:0;
                position:sticky;
                clear:both;
               
            }
            .a{
                background-color:#282828;
width:25%;
color:white;
border:none;
cursor:pointer;
float:left;
padding:12px 24px;
            }
            .a:hover
            {
                        background-color:black;
 width:25%;
color:white;
border:none;
cursor:pointer;
float:left;
padding:12px 24px;
            }
            .di1{
              float:left;
               margin-left:100px;
              
            }
             .di2{
              float:left;
             
                margin-left:100px;
             }
            
             .di3{
               
              float:left;
               margin-left:100px;
              
            }
             .di4{
              float:left;
               margin-left:200px;
             
              
            }
            .d
            {
                color:red;
             text-align: center;
             font-size: 25px;
            }
            
            .a:hover{
transition-duration:1s;
transform:translate(0px,-5px);
box-shadow:0px 7px 1px white;}
            
            .e{
               
             text-align: center;
             font-size: 22px;
             
            }
            table,th,td{
             
                    border:1px solid black;
                    border-collapse: collapse;
                    font-size: 21px;
            }
            table
            {
                margin:auto;
                width:1000;
            }
            th{
                height:30px;
                width:150px;
                background-color: black;
                color:white;
                border:1px solid white;
            }
            
            .f input[type="text"]
            {
                font-size: 15px;
                border-radius: 5px;
                width:200px;
                height:30px;
                border:2px solid black;
               
            }
            .g
            {
               height: 40px;
    
   width:200px;
   border-radius: 7px;
   background-color:#ffff33;
   cursor:pointer;
   color: white;
   font-size: 17px;
   text-shadow:3px 3px 6px black;
            }
            .o{
                
                width:500px;
                height:500px;
                border:1px solid black; 
                margin-left: 440px;
                background-color:  #ffbf80;
            }
            
             .g2
            {
                height: 40px;
    
   width:200px;
   border-radius: 7px;
   background-color:red;
   cursor:pointer;
   color: white;
   font-size: 17px;
   text-shadow:3px 3px 6px black;
            }
            .log{
                float: right;
                font-size:20px;
            }
             .g3
            {
               height: 40px;
    
   width:200px;
   border-radius: 7px;
   background-color:green;
   cursor:pointer;
   color: white;
   font-size: 17px;
   text-shadow:3px 3px 6px black;
            }
            
            tr:nth-child(even) {background-color:#ffbf80;}
            </style>
           <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
           
          
            </head>
    <body ng-app="myModule">
      
        <img src="bus-manager-logo.png"  class="im" usemap="#a">
        
        
      <br><br> <div class="di4"> For more information<br>
give a miss call on<br>
1800 267 1999</div>
<div class="di1">Transport<br>
+91 9501105714 <br>
+91 9501105715</div>
<div class="di2">Delhi & NCR<br>
please call on<br>
9599368734</div>
<div class="di3">WB / North East<br>
Helpline<br>
9810355724</div>
        
         <br><br><br><span class="log"><a href="login.html" style="color:red">Logout</a></span> 
        <br>
       
       <div class="main">
           <button class="a"><a href="About us.html">About Us</a></button>
            <button class="a"><a href="Programs.html">Programs</a></button>
             <button class="a"><a href="chalkpad.html">Chalkpad</a></button>
              <button class="a"><a href="feedback.html">Feedback</a></button>
           
        </div><br>
      <center>  <img src="Careers-StaffManagement_Frame2.jpg" class="mySlides" height="420" width="1000">
         <img src="Careers-StaffManagement_Frame2.jpg" class="mySlides" height="420" width="1000"></center><br><br>
         
       <div class="d"> <b> Transport Helpline - 8146651560, 8146651659</b></div><br>
         
       <div class="e"><b><h1>Schedule</h1></b></div>
               
                           
                         
        
        
                                  <div class="o"><center>  <form action="adminaddServlet" method="get" class="f">
                                     Sno :<br><input type="text" name="sno" ><br>
               Route  NO. :<br><input type="text" name="routeno"><br>
                Route :<br><input type="text" name="route"><br>
                    Bus No. :<br><input type="text" name="busno" ><br>
                          Driver Name :<br><input type="text" name="na" ><br>
                              Contact:<br><input type="text" name="contact" ><br>
                                  Timing:<br><input type="text" name="timing" ><br><br>
                                           <input type="submit"  class="g" value="Add">
                                           
                                               </form></center>
                                     </div>
                           <br><br>
               <table id="table">
                  
        <tr>
         
                     <th>S.no</th>
                     <th>Route No.</th>
                     <th>Route</th>
                     <th>Bus NO.</th>
                     <th>Driver Name</th>
                    <th>Contact No.</th>
                    <th>Timing</th>
                    
                     </tr>
                    
                     
                     <% 
                    String sno,rno,route,bno,driname,contact,timing;
                    Configuration cf = null;
                    SessionFactory sf = null;
                    Session s = null;
                    admitadd a = null;
                    try{
                        cf = new Configuration();
                        cf.configure();
                        sf = cf.buildSessionFactory();
                        s = sf.openSession();
                        Query q = s.createQuery("from admitadd");
                        Iterator it = q.iterate();
                        while (it.hasNext()){
                            
                            a = (admitadd)it.next();
                            sno = a.getSno();
                            rno = a.getRno();
                            route = a.getRoute();
                        
                            bno = a.getBno();
                            driname=a.getDriname();
                            contact=a.getContact();
                            timing=a.getTime();
                            
                           
                            
                %>        
                
			<tr>
                            <td><%=sno%></td>
                            <td><%=rno%></td>
                            <td><%=route%></td>
                            <td><%=bno%></td>
                            <td><%=driname%></td>
                             <td><%=contact%></td>
                              <td><%=timing%></td>

			</tr>
                        
                        <%
                            }
                    }catch(Exception e){
                        e.printStackTrace();
                    }
                    
                %>
                 </table>
        
   <script src="Script.js"></script>
            
             <script>
        var myIndex = 0;
        carousel();

        function carousel() {
            var i;
            var x = document.getElementsByClassName("mySlides");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            myIndex++;
            if (myIndex > x.length) {
                myIndex = 1
            }
            x[myIndex - 1].style.display = "block";
            setTimeout(carousel, 3500); // Change image every 2 seconds
        }
        
        var rIndex,
                table = document.getElementById("table");
            
           function checkEmptyInput()
            {
                var isEmpty = false,
                    sno = document.getElementById("sno").value,
                    routeno = document.getElementById("routeno").value,
                    route = document.getElementById("route").value,
            busno = document.getElementById("busno").value,
            na = document.getElementById("na").value,
            contact = document.getElementById("contact").value,
            timing = document.getElementById("timing").value;
            
            
                if(sno === ""){
                    alert("Connot Be Empty");
                    isEmpty = true;
                }
                else if(routeno === ""){
                    alert("Connot Be Empty");
                    isEmpty = true;
                }
                else if(route === ""){
                    alert("Connot Be Empty");
                    isEmpty = true;
                }
                
                else if(busno === ""){
                    alert("Connot Be Empty");
                    isEmpty = true;
                }
                
                else if(na === ""){
                    alert("Connot Be Empty");
                    isEmpty = true;
                }
                
                else if(contact === ""){
                    alert("Connot Be Empty");
                    isEmpty = true;
                }
                
                else if(timing === ""){
                    alert("Connot Be Empty");
                    isEmpty = true;
                }
                return isEmpty;
            }
           
            // add Row
            function addHtmlTableRow()
            {
               
                if(!checkEmptyInput()){
                var newRow = table.insertRow(table.length),
                    cell1 = newRow.insertCell(0),
                    cell2 = newRow.insertCell(1),
                    cell3 = newRow.insertCell(2),
                     cell4 = newRow.insertCell(3),
                      cell5 = newRow.insertCell(4),
                       cell6 = newRow.insertCell(5),
                        cell7 = newRow.insertCell(6),
                        
                    sno = document.getElementById("sno").value,
                    routeno = document.getElementById("routeno").value,
                    route = document.getElementById("route").value,
            busno = document.getElementById("busno").value,
            na = document.getElementById("na").value,
            contact = document.getElementById("contact").value,
            timing = document.getElementById("timing").value;
            
            
                cell1.innerHTML = sno;
                cell2.innerHTML = routeno;
                cell3.innerHTML = route;
                 cell4.innerHTML = busno;
                cell5.innerHTML = na;
                cell6.innerHTML = contact;
                cell7.innerHTML = timing;
                // call the function to set the event to the new row
                selectedRowToInput();
            }
            }
            
            // display selected row data into input text
            function selectedRowToInput()
            {
                
                for(var i = 1; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                      // get the seected row index
                      rIndex = this.rowIndex;
                      document.getElementById("sno").value = this.cells[0].innerHTML;
                      document.getElementById("routeno").value = this.cells[1].innerHTML;
                      document.getElementById("route").value = this.cells[2].innerHTML;
                      document.getElementById("busno").value = this.cells[3].innerHTML;
                      document.getElementById("na").value = this.cells[4].innerHTML;
                      document.getElementById("contact").value = this.cells[5].innerHTML;
                      document.getElementById("timing").value = this.cells[6].innerHTML;
                    };
                }
            }
            selectedRowToInput();
            
            function editHtmlTbleSelectedRow()
            {
              var  sno = document.getElementById("sno").value,
                    routeno = document.getElementById("routeno").value,
                    route = document.getElementById("route").value,
            busno = document.getElementById("busno").value,
            na = document.getElementById("na").value,
            contact = document.getElementById("contact").value,
            timing = document.getElementById("timing").value;
            
            
               if(!checkEmptyInput()){
                table.rows[rIndex].cells[0].innerHTML = sno;
                table.rows[rIndex].cells[1].innerHTML = routeno;
                table.rows[rIndex].cells[2].innerHTML = route;
                table.rows[rIndex].cells[3].innerHTML = busno;
                table.rows[rIndex].cells[4].innerHTML = na;
                table.rows[rIndex].cells[5].innerHTML = contact;
                table.rows[rIndex].cells[6].innerHTML = timing;
               
              }
            }
            
            function removeSelectedRow()
            {
                table.deleteRow(rIndex);
                // clear input text
                document.getElementById("sno").value = "";
                document.getElementById("routeno").value = "";
                document.getElementById("route").value = "";
                document.getElementById("busno").value = "";
                document.getElementById("na").value = "";
                document.getElementById("contact").value = "";
                document.getElementById("timing").value = "";
                
                
            }
        
        
        
        
        
    </script>
       
    </body>
</html>
