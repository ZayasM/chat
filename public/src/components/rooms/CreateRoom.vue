<template>
  <div>
    <input type="text" v-model="roomName">
    <input type="button" v-on:click="createRoom" value="Guardar">
  </div>
</template>


<script>
export default {
  name: 'CreateRoom',

  data () {
    return {
      urlAction : process.env.DOMAIN + "/rooms",
      roomName: "",
    }
  },

  methods: {
    createRoom: function (){
      this.$http.post(this.urlAction,  {name: this.roomName})
      .then(function(response){
        this.$emit('refresh-list')
      }.bind(this));


    }
  }
}

</script>
