<template>
<div class="CardUniqueQR">
<CardViewer 
v-on:delete_qr="delete_qr($event)"
v-if="to_show"
class="" :title="title" :subtitle="subtitle" :subtitleSecond="subtitleSecond" :url="url" :short_url="server_url" :id="short_url"></CardViewer>
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
            url: "https://url2.com",
            answer: "a",
            apiHandle: "https://qrmanager.rfc1149.net/url/",
            redirectHandle: "https://qrmanager.rfc1149.net/redirect/",
            subtitleSecond: "URL",
            to_show: true
        }
    },
    props: {
        short_url: String,
        key: {
            type: Number,
            default: 1
        }
    },
    computed: {
        server_url: function() {
            return this.redirectHandle + this.short_url
        }
    },
    methods:
    {
        delete_qr: function(id) {
            this.$emit('delete_qr', id)
            this.to_show = false
        }
    },
    watch: {
        short_url: function() {
            var vm = this
            this.to_show = true
            axios.get(this.apiHandle + this.short_url,  {withCredentials: true})
            .then(function (response) {
                vm.url = response.data.url
                console.log(response.data.url)
                })
            .catch(function (error) {
                vm.answer = 'Error! Could not reach the API??? ' + error
                console.log(error)
                })
        }
    },
    created: function() {
        var vm = this
        axios.get(this.apiHandle + this.short_url,  {withCredentials: true})
            .then(function (response) {
                vm.url = response.data.url
                console.log(response.data.url)
                })
            .catch(function (error) {
                vm.answer = 'Error! Could not reach the API??? ' + error
                console.log(error)
                })
        }


}
</script>

<style>

</style>
