


<template>
<div class="shadow-1 ma4 flex justify-between m4 pv2 mh3">
    <div class="flex justify-between ph4">
        <div class="A pa1">
             <h4 class="f3">{{ title }} </h4>
        <h5 class="f4">{{ subtitle }}</h5>
        <p class="f4">{{ url }}</p>
        </div>
        <div class="b pl5">
            <ImageQR class="center" :data="short_url"></ImageQR>
            <p class="f5"> {{ short_url }} </p>
        </div>
    </div>
    <div class="pr3 pt4">
    <!--<router-link to='/me/stats'><button>  Statistiques </button></router-link>-->
    <router-link :to="{ name: 'ChartSepare', params: { AdrQR: short_url }}"><button>  Statistiques </button></router-link>
    <router-link :to="{ name: 'edit', params: { id: short_url } }"><button> Edit </button></router-link>

    </div>

</div>
</template>

<script>
import ImageQR from "./ImageQR.vue"

export default {
       components: {
        ImageQR,

    },
    name: "CardViewer",
    props: {
        title: String,
        subtitle: String,
        url: String,
        short_url: String
    }
}
</script>

<style>

</style>
