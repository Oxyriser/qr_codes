<template>
<div class="titlebar">
     <TopBar class=""></TopBar>
     <div class="center tc pa4 pt5">
     <span><img :src="img" alt="" width="80" heigh="80"></span>
     </div>
</div>
   

</template>


<script>
import QRCode from 'qrcode'
import TopBar from "./TopBar.vue"

export default {
    name: "TitleBar",
    components:
    {
        TopBar
    },
    data: function() {
        return {
            img : "default"
        }
    },
    props: {
        url: {
            type: String,
            default: "https://www.youtube.com/watch?v=6n3pFFPSlW4"
        }
    },

    watch: {
        url: function() {
            if (this.url != "") 
            {
                var vm = this
                QRCode.toDataURL(vm.url, { scale:10, errorCorrectionLevel: 'L'})
                .then(url => {
                    vm.img = url
                })
                .catch(err => {
                    console.error(err)
                    vm.img = ""
                })
            }
            
        }
    },
    created: function() {
        var vm = this
        QRCode.toDataURL(vm.url, { scale:10, errorCorrectionLevel: 'L'})
        .then(url => {
            vm.img = url
        })
        .catch(err => {
            console.error(err)
            vm.img = "error"
        })
    }
}
</script>
<style>
</style>
