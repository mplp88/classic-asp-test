<!--#include virtual="./default.asp"-->
<!--#include virtual="./DAL/connection.asp"-->
<%
Dim acc
Dim salida
Dim alertLevel
Dim ok
Dim oRs
Dim username
Dim password
Dim sql

username = Request.Form("username")
password = Request.Form("password")

alertLevel = "warning"

ok = true

If login = False Then
    ok = False
Else
  Response.Redirect "./index.asp"
End If

Function login() 
  On Error Resume Next
  
  login = False
  
  If username = "" Or password = "" Then
    salida = "Todos los campos son requeridos"
  Else 
    sql = "SELECT Id, UserName, Password FROM Usuarios "
    sql = sql + "WHERE UserName = '" + username + "' "

    Set oRs = Server.CreateObject("ADODB.Recordset")
    
    salida = "El nombre de usuario y contraseña no coinciden."

    If executeQuery(sql, oRs, salida) = False Then
      salida = Replace(salida, "'", "\'")
      salida = "Error ingresando al Sistema. \n ("+salida+")."
    Else
      While oRs.EOF = False
        If oRs.Fields("Password") = password Then
          login = True
          Session("UserName") = oRs.Fields("UserName")
          Session("UserId") = oRs.Fields("Id")
        Else
        End If

        oRs.MoveNext
      Wend
    End If
  End If
  
  If Err.Number <> 0 Then
    salida = Err.Description
    alertLevel = "error"
    login = False
  End If

  Set oRs = Nothing
End Function
%>

<script>
  <%
    If ok Then
      Response.Write "loginSuccess();"
    Else
      Response.Write "loginFailed('"+salida+"', '"+ alertLevel +"');"
    End If
  %>
</script>