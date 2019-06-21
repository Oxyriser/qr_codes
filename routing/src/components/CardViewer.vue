


<template>
<div class="card">
    <h4>{{ title }} </h4>
    <h5>{{ subtitle }}</h5>
    <p>{{ url }}</p>
    <ImageQR class="" :data="short_url"></ImageQR>
    <button> download</button>
    <button> Edit </button>
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
