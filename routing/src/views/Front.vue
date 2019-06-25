<template>

  <div class="front">
    <TitleBar class="" :url="input">
      
    </TitleBar>
    <div class="center tc">
      <GenerateForm class="" @generate="serveQR" @new="input=$event"> Generate </GenerateForm>
      <CardUniqueQR v-if="generated" class="" :short_url="short_url" ></CardUniqueQR>
    </div>
    
  </div>
  
</template>

<script>
// @ is an alias to /src
import _ from 'lodash'
import axios from 'axios'
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
      req: {url: "test"}

    }
  },
  created: function() {
        this.debouncedserveQR = _.debounce(this.serveQR, 500)
  },
  methods: {
   
    serveQR: _.debounce( function (message) {
      var vm = this
      this.generated = true
      axios.post(this.apiHandle, this.req, { withCredentials: true, headers: {
  'Content-Type': 'application/x-www-form-urlencoded'
} })
      .then(function (response) {
            vm.answer = _.capitalize(response.data.answer)
            })
        .catch(function (error) {
            vm.answer = 'Error! Could not reach the API. ' + error
            })
    }, 500, {leading:false}),
  }
};
</script>
