<template>
  <div>
    <h1>Panel Chat</h1>

    <div id="panelChat" v-html="htmlConversation"></div>
    <input type="text" v-model="message" >
    <input type="button" value="enviar" v-on:click="sendMessage">

  </div>

</template>

<script>


export default {
  name: 'PanelChat',
  data () {
    return {
      message: '',
      channelSuscribe: '',
      htmlConversation: '',
      roomId: this.$route.params.id
    }
  },

  mounted : function () {
    this.subscribe()
  },

  methods : {
    subscribe: function() {
      this.channelSuscribe =
      this.$cable.subscriptions.create({ channel: "ChatChannel", room: this.roomId }, {
        connected: function() {
          console.log('conectado a rails')
        },

        received: function(data) {
          this.insertMessage(data.nick, data.message)
        }.bind(this),

        speak: function (message, userId, roomId){
          return this.perform('speak', {
            text: message,
            user_id: userId,
            room_id : roomId
          })

        }
      });
    },

    sendMessage : function(){
      this.channelSuscribe.speak(this.message, this.$session.get('id'), this.roomId)
    },

    insertMessage : function (nick, message){
      this.htmlConversation +=
      "<p><strong>" + nick + ":</strong>" + message + "</p>";
    },
  }
}
</script>

<style scoped>

#panelChat {
  border: 1px solid;
  margin: 10px auto;
  height: 400px;
  width: 600px;
}


</style>
