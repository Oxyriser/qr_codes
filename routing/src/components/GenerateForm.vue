<template>
<div class="GenerateForm ">
    <div class="">
        <form action="" class="mw7 flex flex-column center items-center pa4">
            <div class="mv4" >
            <fieldset class="fl bn ma0 pa0">
                <legend class="pa0 f5 f4-ns mb3 black-80">Website (URL)</legend>        
                <div class="cf dib">
                    <input 
                    class="f6 f5-l input-reset bn shadow-2 fl pa3 lh-solid  br2 br2-ns br--left-ns"
                    v-model="message" v-bind:placeholder="placeholder" v-on:input="$emit('new', message)">
                    <button
                    class ="f6 f5-l bn white bg-black fr pa3 lh-solid  br2-ns br2 br--right-ns"
                    v-on:click='$emit("generate", message)'> <slot> </slot> 
                    </button>
                </div>
            </fieldset>
            </div>
            <div v-if="false"
            class="">
            <br>
            <br>
            <div class="mv4" >
            <fieldset class="fl bn ma0 pa0">
                <legend class="pa0 f5 f4-ns mb3 black-80">Titre (facultatif)</legend>        
                <div class="cf dib">
                    <input 
                    class="f6 f5-l input-reset bn shadow-2  pa3 fl lh-solid  br2 br2-ns br--left-ns"
                    v-model="title" v-bind:placeholder="attempted_title">
                </div>
            </fieldset>
            </div>
         <span hidden>
            <h2>Titre</h2>
            <input v-model="title" v-bind:placeholder="MonQR">
            <h2>Sous titre</h2>
            <input v-model="subtitle" v-bind:placeholder="inscriptions">
        </span>   
        <br>
        </div>    

        </form>
      </div> 
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
            subtitle: "",
            MonQR: "ha",
            inscriptions: "bb",
            titre: "qr manager"
        }
    },
    
    computed: {
        attempted_title: function ()
        {
            return this.titre
        }
    }

}
</script>

<style>

</style>
