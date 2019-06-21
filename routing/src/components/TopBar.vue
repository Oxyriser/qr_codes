<template>
<div class="connection_bar">
    <TitleBar class="" :url="message"></TitleBar>
    <HomeButton v-if="connected"></HomeButton>  
    <ConnectionButton v-else></ConnectionButton>
</div>    
</template>


<script>
import HomeButton from "./HomeButton.vue"
import ConnectionButton from "./ConnectionButton.vue"
import TitleBar from "./TitleBar.vue"
export default {
    name: "TopBar",
    components: {
    TitleBar,
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
