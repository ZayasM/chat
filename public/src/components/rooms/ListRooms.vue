<template>
  <div>
    <h1>SALAS</h1>

    <input type="button" value="Añadir Sala" v-on:click="seen = true">
    <ul>
      <li v-for="item in listRoom">
        <router-link :to="'/rooms/' + item.id">{{ item.name }}</router-link>
      </li>

    </ul>
    <div v-if="seen">
      <span v-on:click="seen = false" >CERRAR</span>
      <create-room v-on:refresh-list="getRooms"></create-room>
    </div>
  </div>
</template>

<script>

import CreateRoom from './CreateRoom'

export default {
  name: 'ListRooms',
  data () {
    return {
      urlAction : process.env.DOMAIN + "/rooms",
      listRoom :[],
      seen: false
    }
  },

  components : {
    CreateRoom
  },

  mounted: function () {
    this.getRooms()
  },

  methods: {
    getRooms: function (){
      this.$http.get(this.urlAction)
      .then(function(response){
        this.listRoom = response.data;

      }.bind(this))
    }
  }
}
</script>
