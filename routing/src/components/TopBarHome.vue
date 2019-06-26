<template>
<div class="TopBar">
<nav class="flex justify-between bg-black b--black-10">
  <a class="link white-70 hover-white no-underline flex items-center pa3" href="">
  <img src="../assets/qr.png" alt="logo" height="80">
  </a>
  <div class="flex-grow pa3 flex items-center">
    <router-link class="mh3 f6 dib white bg-animate hover-bg-white hover-black no-underline pv2 ph4 br-pill ba b--white-40"
      to="front"> Nouveau </router-link>
    <router-link class="mh3 f6 dib white bg-animate hover-bg-white hover-black no-underline pv2 ph4 br-pill ba b--white-40"
      to='/url/stats'> Statistiques </router-link>
  </div>
</nav>
</div>
</template>

<script>
import HomeButton from "./HomeButton.vue"
import ConnectionButton from "./ConnectionButton.vue"


export default {
    name: "TopBar",
    components: {
    HomeButton,
    ConnectionButton
  },
    props: {
        connected: {
            type: Boolean,
            default: true
        },
        message: String
    }
}
</script>
<style>

</style>
