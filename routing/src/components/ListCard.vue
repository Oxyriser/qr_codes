<template>
<div class="ListCard">
    <card-unique-q-r
    @delete_qr="remove_this(id)"
    v-for="id in mutable_ids"
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
    data: function () {
    return {
           
        }
    },
    props: {
        ids: Array
    },
    computed:
    {
       mutable_ids: function(){
           return this.ids
       }
    },
    methods: {
        remove_this(id) {
            //this.mutable_ids.splice(this.mutable_ids.indexOf(id))
            console.log(id + 
            this.mutable_ids.indexOf(id))
            this.$emit('delete_qr', id)
        }
    }


}
</script>

<style>

</style>
