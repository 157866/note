import Axios from '../tool/http.js'

function testApi() {
    return Axios({
        method: 'psot',
        url: '/test',
        params: {

        }
    })
}

export default {
    testApi
}