<template>
  <div class="home">
    <TopBarHome class="">
    </TopBarHome>
    <PleaseConnect v-if="notconnected" @click="get_QR" class=""> </PleaseConnect>
    <ListCard class="" :ids="shorts"></ListCard>    
  </div>
  
</template>

<script>
// @ is an alias to /src
import _ from 'lodash'
import axios from 'axios'
import TopBarHome from "../components/TopBarHome.vue"
import ListCard from "../components/ListCard.vue"
import PleaseConnect from "../components/PleaseConnect.vue"

export default {
  components: {
    ListCard,
    TopBarHome,
    PleaseConnect
  },
  data: function () {
    return {
      input: "https://www.youtube.com/watch?v=6n3pFFPSlW4",

      apiHandle: "https://qrmanager.rfc1149.net/url",

      shorts: [
      ],
      test: "nope",
      notconnected: false
    }
  },
  created: function() {
    this.get_QR()
  },
  
  methods: {
    get_QR: function() {
      var vm = this
      this.test = "yes?"
      axios.get(this.apiHandle, {withCredentials: true})
        .then(function (response) {
          console.log(response)
          vm.shorts = response.data.liste.map(function(qr) {return qr.id})
          vm.test= "yeah!"
          console.log(vm.shorts)

        })
        .catch(function (error) {
          if(error.response) {
            console.log(error.response.status)
            if(error.response.status == 401) {
              console.log("not connected")
              vm.notconnected = true
            }
          }
        })

    }
  }
};
</script>
