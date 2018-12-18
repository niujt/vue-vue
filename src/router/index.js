import Vue from 'vue'
import Router from 'vue-router'
import Index from '@/components/index'
import Citylist from '@/components/Citylist'
import Userlist from '@/components/Userlist'
import Login from '@/components/Login'
import VueResource from 'vue-resource'
Vue.use(VueResource);
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'login',
      component: Login
    },
    {
      path: '/index',
      name: 'index',
      component: Index
    },
    {
      path: '/city',
      name:'Citylist',
      component: Citylist
    },
    {
      path: '/user',
      name:'Userlist',
      component: Userlist
    }
  ]
})
