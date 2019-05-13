<%-- 
    Document   : admin
    Created on : Apr 1, 2019, 12:37:27 AM
    Author     : dell
--%>

<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Query"%>
<%@page import="modal.admitadd"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
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
            .o{
                
                width:500px;
                height:430px;
                border:1px solid black; 
                margin-left: 440px;
                background-color:  #ffbf80;
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
            .log{
                float: right;
                font-size:20px;
            }
        
            tr:nth-child(even) {background-color:#ffbf80;}
            </style>
           <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
           
          
            </head>
    <body ng-app="myModule">
      
        <img src="bus-manager-logo.png"  class="im" usemap="#a">
        <map name="a">
            <area shape="rect" coords="0,0,300,112" href="admin.html" >
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
9810355724</div>
        <br><br><br><span class="log"><a href="login.html" style="color:red">Logout</a></span> 
        
        <br>
       
       <div class="main">
           <button class="a"><a href="adstudent.html">Students</a></button>
            <button class="a"><a href="adstaff.html">Staff</a></button>
             <button class="a"><a href="request.html">Request</a></button>
              <button class="a"><a href="adfeed.html">Feedback</a></button>
           
        </div><br>
     
        <center> <img src="Admin-resized-2.jpg" class="mySlides" height="420" width="1000"></center><br><br>
         
       <div class="d"> <b> Transport Helpline - 8146651560, 8146651659</b></div><br>
         
       <div class="e"><b><h1>Schedule</h1></b><div>
               
                         
                          <div class="o">         <form action="updateServlet" method="get" class="f">
                                     
               Route  NO. :<br><input type="text" name="routeno"><br>
                Route :<br><input type="text" name="route"><br>
                    Bus No. :<br><input type="text" name="busno" ><br>
                          Driver Name :<br><input type="text" name="na" ><br>
                              Contact:<br><input type="text" name="contact" ><br>            
                              Timing:<br><input type="text" name="timing" ><br><br>
                                           <input type="submit" class="g3" value="Update">
                                           
                                                  </form></div>
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
        </div>
        
        
   <script src="Script.js"></script>
            
          
        
        
        
        
        
    
       
    </body>
</html>

