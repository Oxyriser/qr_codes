<template>
<div class="ListCard">
<ul>
    <li v-for="card_id in ids">
        <CardUniqueQR class="" :short_url="card_id"></CardUniqueQR>
    </li>
</ul>
</div>
</template>

<script>
import CardUniqueQR from "./CardUniqueQR.vue"
export default {
    components: {
        CardUniqueQR
    },
    props: {
        ids: []
    }


}
</script>

<style>

</style>
