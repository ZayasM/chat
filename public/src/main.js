import Vue from 'vue'
import App from './App.vue'
import axios from 'axios'
import { createRouter } from './route.js'
import actionCable from 'actioncable'
import vueSession from 'vue-session'



process.env.DOMAIN = "http://localhost:3000"
Vue.prototype.$http = axios
Vue.prototype.$cable = actionCable.createConsumer(process.env.DOMAIN + "/cable");
Vue.use(vueSession)


const router = createRouter()


const app = new Vue({
  router,
  el: '#app',
  render: h => h(App)
})
