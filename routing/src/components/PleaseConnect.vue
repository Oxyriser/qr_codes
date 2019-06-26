<template>
    <div class="bg-red pa3 flex justify-center">
        <ConnectionButton class="pa2 br2 teal hover-black fw6 underline" 
        @click="$emit(click)">
        </ConnectionButton>
    </div>
</template>

<script>
import ConnectionButton from "./ConnectionButton"

export default {
    components: {
        ConnectionButton
    }
    
}
</script>

<style>

</style>
