function alertError(mensaje) {
  try {
    swal("Error Inesperado", mensaje, 'error');

    return true;
  } catch (e) {
    alert(e);
    return false;
  }
}