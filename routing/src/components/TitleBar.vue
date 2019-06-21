<template>
<div class="TitleBar">
    <h1>QR Manager</h1>
    <span><img :src="img" alt="" width="80" heigh="80"></span>
</div>
</template>


<script>
import QRCode from 'qrcode'

export default {
    name: "TitleBar",

    data: function() {
        return {
            img : "default"
        }
    },
    props: {
        url: String,
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
