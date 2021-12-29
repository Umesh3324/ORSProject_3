<%@page import="in.co.rays.project_3.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
    <Head>
         <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
      <!--  This is for showing icon in title bar. -->  
      <link rel="stylesheet" href="css/BackGround.css">
     <title>ORS</title>
        <link rel="shortcut icon" href="image/TitleIcon.png" type="image/x-icon">
    </Head>
    <body >
   <!--  <div class="bg"> -->

    <div id="wrapper"><% for(int i=1;i<11;i++){ %>
        <div class="bubble x<%=i%>"></div><%}%>
    </div>
    
    
    
    <div class="logo" >
          <div class="word" id="uperquote"><font id="it">Think IT </font>Think Us</div>
        <img src="image/sun.png" id="sun">
        <font id="R" >R</font><font id="AYS">AYS</font>
        <div class="word" id="iso">ISO 9001:2015 Company</div>
        <div class="word" id="year">Since 2006</div>
    </div>
   <!--  <br><br><br>
   <h1 align="Center">
  <img src="image/rays.png" width="318" height="127" border="0">
</h1> -->
    <h1 align="center">Presents</h1>
    <h1 align="Center">
 <font size="10px" color="red">
	Online Result System 
 </font>
</h1>

<br><br>
<h2 align="center">Your School on your Single<a href="<%=ORSView.WELCOME_CTL%>"> Click</a></h2>

<!-- </div> -->
</body>
</html>