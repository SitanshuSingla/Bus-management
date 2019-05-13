<%-- 
    Document   : searchStudent
    Created on : Apr 2, 2019, 10:11:39 AM
    Author     : dell
--%>

<%-- 
    Document   : student
    Created on : Apr 1, 2019, 10:11:13 PM
    Author     : dell
--%>


<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="modal.admitadd"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            .log{
                float: right;
                font-size:20px;
            }
           
            .se{
                padding:6px 25px;
                background-color: powderblue;
            }
            tr:nth-child(even) {background-color:#ffbf80;}
            </style>
           <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
           
          
            </head>
    <body ng-app="myModule">
      
        <img src="bus-manager-logo.png"  class="im" usemap="#a">
        <map name="a">
            <area shape="rect" coords="0,0,300,112" href="student.jsp" >
        </map>
        
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
9810355724



</div>
        
      <br><br><br><span class="log"><a href="login.html" style="color:red">Logout</a></span> 
        <br>
       
       <div class="main">
           <button class="a"><a href="About us.html">About Us</a></button>
            <button class="a"><a href="Programs.html">Programs</a></button>
             <button class="a"><a href="chalkpad.html">Chalkpad</a></button>
              <button class="a"><a href="feedback.html">Feedback</a></button>
           
        </div><br>
      <center>  <img src="school-transport-tystem-banner.jpg" class="mySlides" height="380" width="1100">
         <img src="SchoolBus-NashvilleTransportation.jpg" class="mySlides" height="380" width="1100"></center><br><br>
         
       <div class="d"> <b> Transport Helpline - 8146651560, 8146651659</b></div><br>
         
       <div class="e"><b>UNIVERSITY- ROUTE 2018-19</b><div><br><br>
                 
           <div   >  
               
               <table id="table">
                  
 
                   
                   
                   <tr>
         
                     <th>S.no</th>
                     <th>Route No.</th>
                     <th>Route</th>
                     <th>Bus NO.</th>
                     <th>Driver Name</th>
                    <th>Contact No.</th>
                    <th>Timing</th>
                    
                     
                     
                     <% 
                         String sno;
                          String  rno;
                          String  route;
                        
                           String bno;
                           String driname;
                           String contact;
                           String timing;
                    List<admitadd> list = (List<admitadd>)request.getAttribute("res");
                    System.out.println(list.size());
                    try{
                        
                        for(admitadd a : list){
                            
                            
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
        </div>
        
        
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
        
        
        
        
        function sortTable() {
  var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementById("table");
  switching = true;
  /*Make a loop that will continue until
  no switching has been done:*/
  while (switching) {
    //start by saying: no switching is done:
    switching = false;
    rows = table.rows;
    /*Loop through all table rows (except the
    first, which contains table headers):*/
    for (i = 1; i < (rows.length - 1); i++) {
      //start by saying there should be no switching:
      shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:*/
      x = rows[i].getElementsByTagName("TD")[2];
      y = rows[i + 1].getElementsByTagName("TD")[2];
      //check if the two rows should switch place:
      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
        //if so, mark as a switch and break the loop:
        shouldSwitch = true;
        break;
      }
    }
    if (shouldSwitch) {
      /*If a switch has been marked, make the switch
      and mark that a switch has been done:*/
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
    }
  }
}
    </script>
       
    </body>
</html>
