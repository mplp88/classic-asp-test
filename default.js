function loginFailed(salida){
  try {
    alert("Error ejecutando el Login. \n" + salida);
    return true;
  } catch (error) {
    return false;
  }
}