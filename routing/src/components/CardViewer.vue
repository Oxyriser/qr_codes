


<template>
<div class="shadow-1 ma4 flex justify-around m4 pv2 mh3">

    <div class="flex justify-around ph4">
        <div class="A pa1 mr3 pa3">
          <h4 class="f3">{{ title }} </h4>
          <h5 class="f4">{{ subtitle }}</h5>
          <h5 class="f4">{{subtitleSecond}}</h5>
        </div>
        <div class="b pl5 mr3 pa3">
          <ImageQR class="center" :data="short_url"></ImageQR>
          <p class="f5" style="line-height: 90%;"> {{ short_url }} </p>
          <p class="f5" style="line-height: 350%;">{{ url }}</p>
        </div>
        <div class="pr3 pt4 mr3 pa3">
          <!--<router-link to='/me/stats'><button>  Statistiques </button></router-link>-->
          <div class="flex flex-column">
            <div class="w-25 pa3 mr2 pl4">
              <router-link :to="{ name: 'ChartSepare', params: { IDQR: '1' }}"><button class ="no-underline near-white bg-animate bg-near-black hover-bg-gray inline-flex items-center ma2 tc br2 pa2 br-pill">  Statistiques </button></router-link><br>
            </div>
            <div class="w-25 pa3 mr2 pl5">
              <router-link :to="{ name: 'edit', params: { id: short_url } }"><button class ="no-underline near-white bg-animate bg-near-black hover-bg-gray inline-flex items-center ma2 tc br2 pa2 br-pill"> Edit </button></router-link>
            </div>
          </div>


        </div>
    </div>
    <div class="pr3 pt4">
    <!--<router-link to='/me/stats'><button>  Statistiques </button></router-link>-->
    <router-link :to="{ name: 'ChartSepare', params: { IDQR: '1' }}"><button>  Statistiques </button></router-link>
    <router-link :to="{ name: 'edit', params: { id: id } }"><button> Edit </button></router-link>
    <button v-on:click="$emit('delete_qr', id)"> delete </button>
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
        subtitleSecond: String,
        url: String,
        short_url: String,
        id: String
    }
}
</script>

<style>

</style>
