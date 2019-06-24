<template>
<div class="GenerateForm">
        <form action="" class="flex justify-center mw7 center pa4">
            <fieldset class="bn ma0 pa0">
            <legend class="pa0 f5 f4-ns mb3 black-80">Website (URL)</legend>        
            <div class="cf dib">
                 <input 
            class="f6 f5-l input-reset bn shadow-2 fl pa3 lh-solid  br2 br2-ns br--left-ns"
            v-model="message" v-bind:placeholder="placeholder" v-on:input="$emit('new', message)">
            <button
            class ="f6 f5-l bn white bg-black fl pa3 lh-solid  br2-ns br2 br--right-ns"
             v-on:click='$emit("generate", message)'> <slot> </slot> 
             </button>
            </div>
           
            </fieldset>
            
         <span hidden>
            <h2>Titre</h2>
            <input v-model="title" v-bind:placeholder="MonQR">
            <h2>Sous titre</h2>
            <input v-model="subtitle" v-bind:placeholder="inscriptions">
        </span>   
        <br>
    

        </form>
         
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
