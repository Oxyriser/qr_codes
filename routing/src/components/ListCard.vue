<template>
<div class="ListCard">
    <card-unique-q-r
    v-for="id in ids"
    v-bind:key="id"
    v-bind:short_url="id">
    </card-unique-q-r>
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
