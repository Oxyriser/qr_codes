<template>
    <a href=""><button @click="connect_api"> connect aaaaa</button>    </a>
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
