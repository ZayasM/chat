import Vue from 'vue'
import App from './App.vue'



process.env.DOMAIN = "http://localhost:3000";

 new Vue({
  el: '#app',
  render: h => h(App)
})
