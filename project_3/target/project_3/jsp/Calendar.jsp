<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>jQuery UI Datepicker - Display month &amp; year menus</title>

 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script>
  $( function() {
    $( "#datepicker" ).datepicker({
      changeMonth: true,
      changeYear: true,
      changeMonth : true,
		changeYear : true,
		defaultDate : "06/06/2001",
		yearRange : '1970:2030',
		dateFormat : 'dd/mm/yy',
		endDate : '-18y',
			maxDate:0 
    });
  } );
  </script>

</head>
<body>

</body>
</html>