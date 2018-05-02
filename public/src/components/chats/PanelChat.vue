<template>
  <div>
    <h1>Chat</h1>

    <div id="panelChat" class="col s12" v-html="htmlConversation"></div>
    <div class="row">

      <div class="input-field col s12">
        <input id="roomName" type="text" v-model="message" >
      </div>

      <button class="btn waves-effect waves-light col s2" v-on:click="sendMessage" type="button">
        Enviar
        <i class="material-icons right">send</i>
      </button>
    </div>
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
  border: 1px solid #616161 ;
  overflow: auto;
  margin: 10px auto;
  height: 400px;
}


</style>
