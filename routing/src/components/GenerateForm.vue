<template>
<div class="GenerateForm">
         <h2>Website (URL)</h2>        
    
         <span>
            <input v-model="message" v-bind:placeholder="placeholder" v-on:input="$emit('new', message)">
            
         </span>
         <span>
            <h2>Titre</h2>
            <input v-model="title" v-bind:placeholder="MonQR">
            <h2>Sous titre</h2>
            <input v-model="subtitle" v-bind:placeholder="inscriptions">
        </span>   
        <br>
        <button v-on:click='$emit("generate", message)'> Generate </button>
    
</div> 
</template>

<script>
export default {
    name: "GenerateForm",
    data: function () {
        return {
            placeholder: "https://qrm.fr",
            message: "",
            title: "",
            subtitle: ""
        }
    }
}
</script>

<style>

</style>
