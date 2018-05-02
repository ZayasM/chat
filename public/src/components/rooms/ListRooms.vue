<template>
  <div>
    <h1>SALAS</h1>

    <button class="btn waves-effect waves-light row" v-on:click="isSeenBox" type="button">
      Añadir Sala
    </button>

    <ul  class="row ">
      <li class="col s4" v-for="item in listRoom">

        <router-link class="itemRoom" :to="'/rooms/' + item.id">{{ item.name }}</router-link>
      </li>

    </ul>
    <div  id="boxCreateRoom" v-if="seenBox">
        <i v-on:click="isSeenBox" class="closed-icon material-icons right">close</i>
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
      seenBox: false
    }
  },

  components : {
    CreateRoom
  },

  mounted: function () {
    this.getRooms()
  },

  methods: {
    isSeenBox: function (){
      if(!this.seenBox){
        this.seenBox = true;
      }else{
        this.seenBox = false;
      }

    },
    getRooms: function (){
      this.$http.get(this.urlAction)
      .then(function(response){
        this.listRoom = response.data;

      }.bind(this))
    }
  }
}
</script>

<style scoped>
.itemRoom {
  min-height: 30px;
  margin: 4px 0px;
  max-width: 90%;
  width: 96%;
  padding: 2%;
  display: block;
  background-color: #757575;
}

.itemRoom {
  color: #FFF;
  text-transform: uppercase;
}

#boxCreateRoom{
  max-width: 400px;
  width: 90%;
  position: absolute;
  top: 29%;
  left: 33%;
  z-index: 999;
  margin: 0 auto;
  background-color: #e0e0e0;
  padding: 10px 1%;
  border: 1px solid #e0e0e0;
}


</style>
