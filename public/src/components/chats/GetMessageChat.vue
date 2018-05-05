<template>
</template>

<script>

export default {
  name : 'GetMessageChat',

  props : {
    roomId: {
      type: String,
      required: true
    }
  },

  data () {
    return {
      limitMessage : 20,
      urlAction : process.env.DOMAIN +
      "/rooms/" + this.roomId + "/messages?limit=",

    }
  },

  created : function () {
    this.getMessage()
  },

  methods : {
    getMessage : function(){

      this.$http.get(this.urlAction + this.limitMessage)
      .then(function(response){
        this.mountMessage(response.data)

      }.bind(this))

    },

    mountMessage : function (listMessage){

      listMessage.reverse()
      listMessage.forEach(function(item){
        this.$emit('refresh-message',item[0].name, item[0].text)
      }.bind(this))

    }
  }

}

</script>
