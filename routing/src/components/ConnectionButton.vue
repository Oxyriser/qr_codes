<template>
    <a href="#" class="mh3 f6 dib white bg-animate hover-bg-white hover-black no-underline pv2 ph4 br-pill  bg-black" @click="connect_api" > connect </a>
</template>

<script>

import axios from "axios"
export default {
    name: "ConnectionButton",
    methods:{
        connect_api: function()
        {
            axios.get("https://qrmanager.rfc1149.net/auth/google?scope=email%20profile")
        }
    }
}

</script>

<style>

</style>
