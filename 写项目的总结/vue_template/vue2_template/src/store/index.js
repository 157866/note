import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)

const actions = {
    setUserName(context, value) {
        context.commit('GetUserName', value)

    }
}
const mutations = {
    GetUserName(state, value) {
        state.userName = value
    },

}
const state = {
    userName: null,

}
export default new Vuex.Store({
    actions,
    mutations,
    state
})