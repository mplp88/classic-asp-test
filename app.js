$(document).ready(function () {
  Vue.component('login-form', {
    template: `<div class="container">
      <form v-on:submit="doLogin" class="table" id="formu" method="POST" action="./login.asp">
        <div class="row">
          <label for="username">Usuario</label>
          <input v-model="username" class="form-control" type="text" name="username" id="username" value="" autofocus>
        </div>
        <div class="row">
          <label for="password">Contraseña</label>
          <input v-model="password" class="form-control" type="password" name="password" id="password" value="">
        </div>    
        <div class="row">
          <input class="btn btn-primary" type="submit" value="Ingresar">
        </div>
      </form>
      <div id="error-messages">
      </div>
    </div>`,
    data: function () {
      return {
        username: '',
        password: '',
        message: ''
      }
    },
    methods: {
      doLogin: function (e) {
        if (!this.validate()) {
          e.preventDefault();
          loginFailed(this.message, 'warning');
        } else {
          return true;
        }
      },
      validate: function () {
        var ret = true;
        this.message = '';
        this.message += '<ul>';
        if (this.username == '') {
          this.message += '<li>';
          this.message += "El campo usuario no puede estar vacío.";
          this.message += '</li>';
          ret = false;
        }
        if (this.password == '') {
          this.message += '<li>';
          this.message += "El campo contraseña no puede estar vacío.";
          this.message += '</li>';
          ret = false
        }
        this.message += '</ul>';

        return ret;
      }
    }
  })

  var app = new Vue({
    el: '#app',
    data: function () {
      return {

      }
    },
    methods: {
      logOut: function () {
        window.location.href = './logout.asp';
      }
    }
  })
});