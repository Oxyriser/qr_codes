<template>
<div class="TopBar">
<nav class="flex justify-between bg-black b--black-10">
  <a class="link white-70 hover-white no-underline flex items-center pa3" href="">
  <img src="../assets/qr.png" alt="logo" height="80">
  </a>
  <div class="flex-grow pa3 flex items-center">
    <HomeButton  class=" mh3 f6 dib white bg-animate hover-bg-white hover-black no-underline pv2 ph4 br-pill ba b--white-40"></HomeButton>  
    <ConnectionButton class=" mh3 f6 dib white bg-animate hover-bg-white hover-black no-underline pv2 ph4 br-pill ba b--white-40"></ConnectionButton>
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
            default: false
        },
        message: String
    }
}
</script>
<style>

</style>
