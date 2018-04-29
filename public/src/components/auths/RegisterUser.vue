<template>
  <div class="register-user">
    <input type="text" name="name" placeholder="Nombre"/>
    <input type="button" name="button-register" v-on:click="registerNick" value="Enviar">
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'RegisterUser',
  data () {
    return {
      urlAction : process.env.DOMAIN + "/rooms",
    }
  },
  methods: {
    registerNick: function(){
      axios.post(this.urlAction,  {name: "Legolas"})
      .then(function(response){
        alert(response)
      })
    }
  }
}
</script>
