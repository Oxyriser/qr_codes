<template>
<div class="CardUniqueQR">
<CardViewer class="" :title="title" :subtitle="subtitle" :url="url" :short_url="server_url"></CardViewer>
</div>
</template>

<script>

import CardViewer from "./CardViewer.vue"
import _ from 'lodash'
import axios from 'axios'

export default {
    components: {
        CardViewer
    },
    data: function() {
        return {
            title: "titre",
            subtitle: "soustitre",
            url: "https://url.com",
            answer: "a",
            apiHandle: "http://qrmanager.rfc1149.net:4000/url/"
        }
    },
    props: {
        short_url: String
    },
    computed: {
        server_url: function() {
            return this.apiHandle + this.short_url
        }
    },
    created: _.debounce(function() {
        var vm = this
        axios.get(this.apiHandle + this.short_url,  {withCredentials: true})
            .then(function (response) {
                vm.url = _.capitalize(response.data.url)
                })
            .catch(function (error) {
                vm.answer = 'Error! Could not reach the API. ' + error
                
                })
        }, 500, {leading:false})

    
}
</script>

<style>

</style>
