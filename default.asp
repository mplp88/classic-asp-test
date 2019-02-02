<%
  If Session("UserId") <> "" And Session("UserName") <> "" Then
    Response.Redirect("./index.asp")
  End If
%>

<!DOCTYPE html>
<html lang="es">
<head>
  <!--#include virtual="head.asp"-->
  <script src="./login.js"></script>
</head>
<body>
<div id="app" class="container">
  <h2>Bienvenido/a</h2>
  <login-form></login-form>
</div>
</body>
</html>