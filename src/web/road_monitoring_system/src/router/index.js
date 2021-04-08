import Vue from 'vue'
import Router from 'vue-router'
import Map from '../components/Map.vue'
import Login from '../components/Login.vue'


Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: '',
      component: Login
    },
    {
      path: '/Login',
      name: 'Login',
      component: Login,
    },
    {
      path: '/Map',
      name: 'Map',
      component: Map,
      meta:{
        requireAuth:true 
      }
    }

  ]
})
