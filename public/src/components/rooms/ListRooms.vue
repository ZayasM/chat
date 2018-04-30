<template>
  <div>
    Hello Rooms
    <ul>
      <li v-for="item in listRoom">
         <router-link :to="'/rooms/' + item.id">{{ item.name }}</router-link>
      </li>

    </ul>
  </div>
</template>

<script>
export default {
  name: 'ListRooms',
  data () {
    return {
      urlAction : process.env.DOMAIN + "/rooms",
      listRoom :[],
    }
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
