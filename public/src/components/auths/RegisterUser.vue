<template>
  <div class="register-user">
    <input type="text"  v-model="userNick" placeholder="Nombre"/>
    <input type="button" name="button-register" v-on:click="registerNick" value="Enviar">
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
