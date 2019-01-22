<!--#include virtual="default.html"-->
<%
Dim acc
Dim salida
Dim ok
Dim oConn
Dim oRs
Dim oCmd
Dim username
Dim password
Dim sql

username = Request.Form("username")
password = Request.Form("password")

ok = true

If login = false Then
    ok = false
Else
  Response.Redirect "./index.html"
End If

Function login() 
  On Error Resume Next
  
  login = false

  Set oConn = Server.CreateObject("ADODB.Connection")

  oConn.ConnectionString = "Provider=SQLNCLI11;Server=.\SQLEXPRESS;Database=TestDB;Integrated Security=SSPI;DataTypeCompatibility=80;"
  oConn.Open

  If username = "" Or password = "" Then
    salida = "Error de transmisión de datos"
  Else 
    sql = "SELECT Id FROM Usuarios "
    sql = sql + "WHERE UserName = '" + username + "' "
    sql = sql + "AND Password = '" + password + "';"
    
    Set oCmd = Server.CreateObject("ADODB.Command")
    Set oCmd.ActiveConnection = oConn
    oCmd.CommandText = sql

    Set oRs = Server.CreateObject("ADODB.Recordset")
    Set oRs = oCmd.Execute
    
    If oRs.EOF = False Then
      If CInt(oRs.Fields("Id")) <> 0 Then
        'Todo Ok. Loggear
        login = True
      End If
    Else
      salida = "El nombre de usuario y contraseña no coinciden."
    End If
  End If

  If Err.Number <> 0 Then
    salida = Err.Description
    login = false
  End If

  Set oConn = Nothing
  Set oRs = Nothing
End Function
%>

<script>
  <%
    If ok = false Then
      Response.Write "loginFailed('"+salida+"');"
    End If
  %>
</script>