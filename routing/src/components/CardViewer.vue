


<template>
<div class="shadow-1 ma4">
    <div class="flex justify-around ph3">
        <div v-if="false" class="A pa1 mr3 pa3">
          
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
          <div class="flex flex-column items-center">
            <div class="mv2">
              <router-link :to="{ name: 'ChartSepare', params: { IDQR: '1' }}"><button class ="no-underline ph3 pv2  near-white bg-animate bg-near-black hover-bg-gray inline-flex tc">  Statistiques </button></router-link><br>
            </div>
            <div class="mv2">
              <router-link :to="{ name: 'edit', params: { id: id } }"><button class ="no-underline ph3 pv2  near-white bg-animate bg-near-black hover-bg-gray inline-flex tc "> Edit </button></router-link>
            </div>
            <div class="mv2">
              <button @click="$emit('delete_qr', id)" class ="ph3 pv2 ph4 no-underline near-white bg-animate bg-near-black hover-bg-gray  tc "> delete </button>
            </div>
          </div>


        </div>
    </div>
    <!--
    <div class="pr3 pt4">
    <router-link to='/me/stats'><button>  Statistiques </button></router-link>
    <router-link :to="{ name: 'ChartSepare', params: { IDQR: '1' }}"><button>  Statistiques </button></router-link>
    <router-link :to="{ name: 'edit', params: { id: id } }"><button> Edit </button></router-link>
    </div>
    -->
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
