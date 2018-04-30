import Vue from 'vue'
import Router from 'vue-router'
import RegisterUser from './components/auths/RegisterUser'
import ListRooms from './components/rooms/ListRooms'
import PanelChat from './components/chats/PanelChat'

Vue.use(Router)


export function createRouter () {
  return new Router({
    mode: 'history',
    fallback: false,
    scrollBehavior: () => ({ y: 0 }),
    routes: [
      { path: '/', component: RegisterUser },
      { path: '/rooms', component: ListRooms },
      { path: '/rooms/:id', component: PanelChat }

    ]
  })
}
