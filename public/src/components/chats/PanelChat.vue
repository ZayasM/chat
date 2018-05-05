<template>
  <div>
    <h1>Chat</h1>

    <div id="panelChat" class="col s12">
      <ul>

        <get-message-chat v-bind:roomId="roomId" v-on:refresh-message="insertMessage">
        </get-message-chat>

        <li v-for="item in listMessage">

          <strong>
            {{item.nick}}
          </strong>
          {{item.message}}

        </li>
      </ul>
    </div>

    <div class="row">
      <div class="input-field col s12">
        <input id="roomName" type="text" v-on:keyup.enter="sendMessage" v-model="message" >
      </div>

      <button class="btn waves-effect waves-light col s2" v-on:click="sendMessage" type="button">
        Enviar
        <i class="material-icons right">send</i>
      </button>
    </div>
  </div>

</template>

<script>

import GetMessageChat from './GetMessageChat'

export default {
  name: 'PanelChat',
  data () {
    return {
      message: '',
      channelSuscribe: '',
      roomId: this.$route.params.id,
      listMessage : []
    }
  },

  components : {
    GetMessageChat
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
      this.listMessage.push({
        nick: nick,
        message: message
      })
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
