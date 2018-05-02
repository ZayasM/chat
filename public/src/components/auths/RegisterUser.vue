<template>
  <div class="register-user col s6 offset-s3">
    <div class="input-field">
      <input placeholder="Placeholder" id="name" type="text" class="validate"  v-model="userNick" >
      <label  class="active" for="name">Nombre</label>
    </div>

    <button class="btn waves-effect waves-light col s2" v-on:click="registerNick" type="button">Enviar
      <i class="material-icons right">send</i>
    </button>

  </div>
</template>

<script>

export default {
  name: 'RegisterUser',
  data () {
    return {
      urlAction : process.env.DOMAIN + "/users",
      userNick : "",
    }
  },
  methods: {
    registerNick: function(){
      this.$http.post(this.urlAction,  {nick: this.userNick})
      .then(function(response){

        this.$session.start()
        this.$session.set('id', response.data.id)

        this.$router.push('rooms')

      }.bind(this))
    }
  }
}
</script>
