<template>
<div class="CardUniqueQR">
<CardViewer class="" :title="title" :subtitle="subtitle" :url="url" :short_url="short_url"></CardViewer>
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
            answer: "a"
        }
    },
    props: {
        short_url: String
    },
    created: _.debounce(function() {
        var vm = this
        axios.get('https://yesno.wtf/api')
            .then(function (response) {
                vm.answer = _.capitalize(response.data.answer)

                })
            .catch(function (error) {
                vm.answer = 'Error! Could not reach the API. ' + error

                })
        }, 500, {leading:false})

    
}
</script>

<style>

</style>
