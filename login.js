function loginSuccess() {
  try {
    swal("¡Login exitoso!", "Usted está siendo redirigido a la página principal. Presione Ok para continuar", "success")
      .then(() => {
        window.location.href = './index.html';
      });
    return true;
  } catch (e) {
    alertError(e);
    return false;
  }
}

function loginFailed(salida, errorLevel) {
  try {
    swal("Error", "Error ingresando a la página.", errorLevel)
      .then(() => {
        var errorCont = document.getElementById('error-messages')
        errorCont.innerHTML = '';
        var oSp = document.createElement('span');
        oSp.innerHTML = salida;
        errorCont.classList.add('alert');

        switch (errorLevel){
          case "error":
            errorCont.classList.add('alert-danger');
            break;
          case "warning":
            errorCont.classList.add('alert-warning');
            break;
          default:
            errorCont.classList.add('alert-primary');
            break
        }
        errorCont.appendChild(oSp);
      });
    return true;
  } catch (e) {
    alertError(e);
    return false;
  }
}