function loginFailed(salida){
  try {

    swal("Error", "Error ingresando a la página.", "error")
    .then(() => {
      var errorCont =document.getElementById('error-messages')
      var oSp = document.createElement('span');
      oSp.innerHTML = salida;
      errorCont.classList.add('alert');
      errorCont.classList.add('alert-danger');
      errorCont.appendChild(oSp);
    });
    return true;
  } catch (error) {
    return false;
  }
}