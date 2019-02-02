<%
Function executeQuery(query, ByRef oRs, ByRef salida)
  On Error Resume Next
  Dim oConn
  Dim oCmd

  executeQuery = False
  
  Set oConn = Server.CreateObject("ADODB.Connection")
  Set oCmd = Server.CreateObject("ADODB.Command")
  oConn.ConnectionString = "Provider=SQLNCLI11;Server=PON-PC;Database=TestDB;Integrated Security=SSPI;DataTypeCompatibility=80;"
  oConn.Open

  If oConn.Errors.Count = 0 Then
    Set oCmd.ActiveConnection = oConn
    oCmd.CommandText = query
    Set oRs = oCmd.Execute
    executeQuery = True
  Else
    salida = "Error abriendo conexión con la base de datos."
  End If

  If Err.Number <> 0 Then
    salida = Err.Description
    executeQuery = False
    On Error GoTo 0
  End If

  Set oConn = Nothing
  Set oCmd = Nothing
End Function
%>