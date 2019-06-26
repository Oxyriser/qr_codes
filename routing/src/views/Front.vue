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
      return {url: this.input}
    }
  },
  created: function() {
        this.debouncedserveQR = _.debounce(this.serveQR, 500)
  },
  methods: {
   
    serveQR: _.debounce( function (message) {
      var vm = this
      this.generated = true
      console.log(querystring.stringify(this.req));
      console.log
      axios.post(this.apiHandle, querystring.stringify(this.req), { withCredentials: true,  })
      .then(function (response) {
            console.log(response.data)
            this.short_url = response.data.id
            })
        .catch(function (error) {
            vm.answer = 'Error! Could not reach the API. ' + error
            })
    }, 500, {leading:false}),
  }
};
</script>
