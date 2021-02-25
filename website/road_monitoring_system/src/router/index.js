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
      path: '/login',
      name: 'Login',
      component: Login,
    },
    {
      path: '/components/Map',
      name: 'Map',
      component: Map,
      meta:{
        loginInfo:true 
      }
    }

  ]
})
