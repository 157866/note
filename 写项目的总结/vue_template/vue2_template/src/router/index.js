import Vue from "vue";
import VueRouter from 'vue-router'

import VueTemplateHome from '../components/home.vue'
import Hello from '../components/HelloWorld.vue'

Vue.use(VueRouter)

const router = new VueRouter({
    routes: [
        {
            path: '/',
            redirect: '/home'
        },
        {
            path: '/home',
            component: VueTemplateHome,
            children: [
                {
                    path: 'hello',
                    name: 'hello',
                    components: {
                        homeView: Hello,
                    }
                }
            ]
        }
    ]

})

export default router