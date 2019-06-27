<template>

  <div class="edit">
    <TopBar class="" :message="input"></TopBar>
     <h2 class="f3 pa3 tc"> edit </h2>
    <GenerateForm class="" @generate="serveQR" @new="input=$event"> Edit </GenerateForm>
    <card-unique-q-r  @delete_qr="remove_QR($event)" class="" :short_url="id" :key="compoKey"></card-unique-q-r>
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
import qs from "qs"

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
      compoKey: 1

    }
  },
 computed:
  {
    correct_input: function()
    {
      if(this.input.match("^https?://")){
        return this.input
      }
      return "https://" + this.input

    },
    req: function()
    {
      return {url: {url: this.correct_input}}
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
      axios.put(
        this.apiHandle + "/" + this.id,
        qs.stringify(this.req),
       {withCredentials: true})
      .then(function (response) {
          //handle success
          console.log(response);
          vm.compoKey += 1
          
      })
      .catch(function (response) {
          //handle error
          console.log(response);
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
};
</script>
