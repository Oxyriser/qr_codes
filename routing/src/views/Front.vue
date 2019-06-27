<template>

  <div class="front">
    <TitleBar class="" :url="correct_input">
      
    </TitleBar>
    <div class="center tc">
      <GenerateForm class="" @generate="serveQR" @new="input=$event"> Generate </GenerateForm>
      <CardUniqueQR @delete_qr="remove_QR($event)" v-if="generated" class="" :short_url="short_url" ></CardUniqueQR>
    </div>
    
  </div>
  
</template>

<script>
// @ is an alias to /src
import _ from 'lodash'
import axios from 'axios'
import  querystring from 'querystring'

import GenerateForm from "../components/GenerateForm.vue"
import TitleBar from "../components/TitleBar.vue"
import CardUniqueQR from "../components/CardUniqueQR.vue"

export default {
  components: {
    GenerateForm,
    TitleBar,
    CardUniqueQR
  },
  data: function () {
    return {
      input: "https://www.youtube.com/watch?v=6n3pFFPSlW4",
      short_url: "163cf0d2-6d94-4d49-bffc-44845bc852c6",
      shorts: [
        'foo',
        'bar',
        'test'
      ],
      generated: false,
      apiHandle: "https://qrmanager.rfc1149.net/url",

    }
  },
  computed:
  {
    req: function()
    {
      return {url: this.correct_input}
    },
    correct_input: function()
    {
      if(this.input.match("^https?://")){
        return this.input
      }
      return "https://" + this.input

    }
  },
  created: function() {
        this.debouncedserveQR = _.debounce(this.serveQR, 500)
  },
  methods: {
   
    serveQR:function (message) {
      var vm = this
      console.log(querystring.stringify(this.req));
      axios.post(this.apiHandle, querystring.stringify(this.req), { withCredentials: true,  })
      .then(function (response) {
            console.log(response.data)
            vm.short_url = response.data.id
            vm.generated = true

            })
        .catch(function (error) {
            vm.answer = 'Error! Could not reach the API. ' + error
      })
    },
    remove_QR: function(id) {
      var vm = this
      axios.delete(this.apiHandle + "/" + id, {withCredentials: true})
      .then(function (response) {
          console.log(response)
          vm.get_QR()
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
}
</script>
