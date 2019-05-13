<%-- 
    Document   : admin
    Created on : Apr 1, 2019, 12:37:27 AM
    Author     : dell
--%>

<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="modal.addinfo1"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Query"%>

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
                font-size: 17px;
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
   background-color:#b3b300;
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
             .t
            {
                  height: 40px;
    
   width:150px;
   border-radius: 7px;
   background-color:powderblue;
   cursor:pointer;
   color: black;
   font-size: 17px;
   text-shadow:3px 3px 6px black;
            }
            .t:hover
            {
                 width:150px;
   border-radius: 7px;
   background-color:powderblue;
   cursor:pointer;
   color: black;
   font-size: 17px;
   text-shadow:3px 3px 6px black;
            }
            h1{
                color:red;
            }
            .log{
                float: right;
                font-size:20px;
            }
            .o{
                
                width:500px;
                height:500px;
                border:1px solid black; 
                margin-left: 440px;
                background-color:  #ffbf80;
            }
        
            tr:nth-child(even) {background-color:#ffbf80;}
            </style>
           <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
           
          
            </head>
    <body ng-app="myModule">
      
        <img src="bus-manager-logo.png"  class="im" usemap="#a">
        <map name="a">
            <area shape="rect" coords="0,0,300,112" href="admin.jsp" >
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
           <button class="a"><a href="displayinfo.jsp">Students</a></button>
            <button class="a"><a href="adstaff.html">Staff</a></button>
             <button class="a"><a href="request.html">Request</a></button>
              <button class="a"><a href="feedback.html">Feedback</a></button>
           
        </div><br> <br><br><br> <br><br><br> <br><br><br> <br><br><br> 
     <center><h1>Student Info</h1></center>
        
      
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
                    String first,last,id,batch,stream,section,mobile;
                    Configuration cf = null;
                    SessionFactory sf = null;
                    Session s = null;
//                    addinfo1 a = null;
                    try{
                        cf = new Configuration();
                        cf.configure();
                        sf = cf.buildSessionFactory();
                        s = sf.openSession();
                        Transaction tx= s.beginTransaction();
                        Query q = s.createQuery("from addinfo1");
//                        Iterator it = q.iterate();
                        List<addinfo1> list= q.list();
                        tx.commit();
//                        while (it.hasNext())
                        for(addinfo1 a: list){
                            
//                            a = (addinfo1)it.next();
                            first = a.getFirst();
                            last = a.getLast();
                            id = a.getId();
                        
                             batch= a.getBatch();
                            stream=a.getStream();
                            section=a.getSection();
                            mobile=a.getMobile();
                            
                           
                            
                %>        
                
			<tr>
                            <td><%=first%></td>
                            <td><%=last%></td>
                            <td><%=id%></td>
                            <td><%=batch%></td>
                            <td><%=stream%></td>
                             <td><%=section%></td>
                              <td><%=mobile%></td>

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

