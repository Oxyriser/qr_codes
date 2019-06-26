<template>
<div class="ImageQR">
    <a :href="img" download>
    <span><img :src="img" alt="" width="80" heigh="80"></span>
    </a>
</div>
</template>


<script>
import QRCode from 'qrcode'

export default {
    name: "ImageQR",

    data: function() {
        return {
            img : "default"
        }
    },
    props: {
        data: String,
    },

    watch: {
        data: function() {
            if (this.data != "") 
            {
                var vm = this
                QRCode.toDataURL(vm.data, { scale:10, errorCorrectionLevel: 'L'})
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
        QRCode.toDataURL(vm.data, { scale:10, errorCorrectionLevel: 'L'})
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
