import Vue from 'vue'
import App from './App.vue'
import axios from 'axios'
import VueRouter from 'vue-router'
import { createRouter } from './route.js'


process.env.DOMAIN = "http://localhost:3000"
Vue.prototype.$http = axios
Vue.prototype.$userRegister = {
  nick: '',
  id: '',
  isActive: false
}// I dont know if it is the best way to use a global variable


const router = createRouter()


const app = new Vue({
  router,
  el: '#app',
  render: h => h(App)
})
