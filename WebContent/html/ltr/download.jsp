 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Download File As ZIP File</title>
    </head>
    <script>
    function download()
    {
    document.form.submit();
    }
    </script>
    <body onload="download()">
       
        <form action="<c:url value="/download" />" method="post" >

            
        </form>
    </body>
</html>