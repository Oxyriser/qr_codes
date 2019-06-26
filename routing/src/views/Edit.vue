<template>

  <div class="edit">
    <TopBar class="" :message="input"></TopBar>
     <h2 class="f3 pa3 tc"> edit </h2>
    <GenerateForm class="" @generate="serveQR" @new="input=$event"> Edit </GenerateForm>
    <card-unique-q-r  class="" :short_url="id" ></card-unique-q-r>
    <br>
  </div>
  
</template>

<script>
// @ is an alias to /src
import _ from 'lodash'
import axios from 'axios'
import GenerateForm from "../components/GenerateForm.vue"
import TopBar from "../components/TopBar.vue"
import CardUniqueQR from "../components/CardUniqueQR.vue"
import  querystring from 'querystring'

export default {
  components: {
    GenerateForm,
    TopBar,
    CardUniqueQR
  },
  props: {

  },
  data: function () {
    return {
      input: "https://www.youtube.com/watch?v=6n3pFFPSlW4",
      short_url: "https://www.youtube.com/watch?v=6n3pFFPSlW4",
      shorts: [
        'foo',
        'bar',
        'test'
      ],
      generated: false,
      id: 0,
      apiHandle: "https://qrmanager.rfc1149.net/url",

    }
  },
 computed:
  {
    req: function()
    {
      return {url: {url: this.input}}
    }
  },
  created: function() {
    this.id = this.$route.params.id;
    this.debouncedserveQR = _.debounce(this.serveQR, 500)
  },
  methods: {
   
    serveQR: function (message) {
      var vm = this
      this.short_url = message
      this.generated = true
      var bodyFormData = new FormData();
      bodyFormData.append('url', this.req);
      
      axios({
      method: 'put',
      url: this.apiHandle + "/" + this.id,
      data: querystring.stringify(this.req),
      withCredentials: true
      })
      .then(function (response) {
          //handle success
          console.log(response);
      })
      .catch(function (response) {
          //handle error
          console.log(response);
      })
     
    }
  }
};
</script>
