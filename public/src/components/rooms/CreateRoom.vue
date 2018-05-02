<template>
  <div>

    <div class="input-field">
      <input  id="roomName" type="text" v-model="roomName" >
      <label  class="active" for="roomName">Nombre de la sala</label>
    </div>


    <button class="btn waves-effect waves-light row" v-on:click="createRoom" type="button">
      Guardar
      <i class="material-icons right">send</i>
    </button>
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
