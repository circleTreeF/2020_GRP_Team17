// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import VueRouter from 'vue-router'
import VueAMap from 'vue-amap'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import axios from 'axios'



Vue.use(ElementUI, axios, VueRouter);
Vue.config.productionTip = false
Vue.prototype.$http = axios
// Vue.prototype.HOST = '/api'


/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>',
  render: h => h(App)
})

// $('.js-fullheight').css('height', $(window).height());
// $(window).resize(function(){
//   $('.js-fullheight').css('height', $(window).height());
// });

// //axios.defaults.baseURL = "https://goodlink.club/management/"


// router.beforeEach((to, from, next) => {
//   // to 表示将要访问的路径
//   // from 表示从哪里跳转来
//   // next 表示放行
//   if (to.path === '/login') return next()
//   const isLogin = sessionStorage.getItem('loginInfo')
//   if (!isLogin) return next('/login')
//   else return next()
// })