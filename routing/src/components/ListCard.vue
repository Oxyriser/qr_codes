<template>
<div class="ListCard">
<ul class="list pl0">
    <li v-for="card_id in ids" class="list pl0">
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
        ids: Array
    }


}
</script>

<style>

</style>
