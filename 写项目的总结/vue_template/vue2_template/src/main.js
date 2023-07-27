import Vue from 'vue'
import App from './App.vue'
// npm install vue-router@3.0.0
import VueRouter from 'vue-router'
// npm install vuex@3
import Vuex from 'vuex'
// npm install axios
import axios from 'axios'
//  npm i element-ui -S
import ElementUI from 'element-ui'

//axios 的封装
import api from "./api"
Vue.prototype.$api = api

import router from './router'

import store from './store'


Vue.use(VueRouter)
Vue.config.productionTip = false
Vue.use(Vuex)
Vue.prototype.axios = axios;
Vue.use(ElementUI)
new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app')
