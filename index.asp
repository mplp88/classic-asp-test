<%
  If Session("UserId") = "" And Session("UserName") = "" Then
    Response.Redirect("./default.asp")
  End If
%>

<!DOCTYPE html>
<html lang="es">
<head>
  <!--#include virtual="head.asp"-->
</head>
<body>
  <h1>Index</h1>
  <div id="app">
    <input v-on:click="logOut" class="btn btn-primary" type="button" value="Salir">
  </div>
</body>
</html>