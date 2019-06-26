


<template>
<div class="shadow-1 ma4 flex justify-between m4 pv2 mh3">
    <div class="flex justify-between ph4">
        <div class="A pa1">
             <h4 class="f3">{{ title }} </h4>
        <h5 class="f4">{{ subtitle }}</h5>
        <h5>{{subtitleSecond}}</h5>
        </div>
        <div class="b pl5">
            <ImageQR class="center" :data="short_url"></ImageQR>
            <p class="f5"> {{ short_url }} </p>
            <p class="f4">{{ url }}</p>
        </div>
    </div>
    <div class="pr3 pt4">
    <!--<router-link to='/me/stats'><button>  Statistiques </button></router-link>-->
    <router-link :to="{ name: 'ChartSepare', params: { IDQR: '1' }}"><button>  Statistiques </button></router-link>
    <router-link :to="{ name: 'edit', params: { id: short_url } }"><button> Edit </button></router-link>
    <button v-on:click="delete_qr"> delete </button>
    </div>

</div>
</template>

<script>
import ImageQR from "./ImageQR.vue"
import axios from 'axios'
export default {
       components: {
        ImageQR,

    },
    data: function() {
        return {
            apiHandle: "https://qrmanager.rfc1149.net/url/"
        }
    },
    name: "CardViewer",
    props: {
        title: String,
        subtitle: String,
        subtitleSecond: String,
        url: String,
        short_url: String,
        id: String
    },

    methods: {
        delete_qr: function (message) {
            var vm = this
            console.log("pwiew piew "  + this.apiHandle + this.id)
            axios.delete(this.apiHandle + this.id, { withCredentials: true,  })
                .then(function (response) {
                        console.log(response)
                })
                .catch(function (error) {
                    console.log("piew" + error)

                    vm.answer = 'Error! Could not reach the API. ' + error
                })
            this.$emit("reload")
        }
    }
}
</script>

<style>

</style>
