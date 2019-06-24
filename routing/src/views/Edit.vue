<template>

  <div class="edit">

    <TopBar class="" :message="input"></TopBar>
    <GenerateForm class="" @generate="serveQR" @new="input=$event"> Edit </GenerateForm>
    <CardUniqueQR v-if="generated" class="" :short_url="short_url" ></CardUniqueQR>
    <br>
    <p>{{id}}</p>
  </div>
  
</template>

<script>
// @ is an alias to /src
import _ from 'lodash'
import axios from 'axios'
import GenerateForm from "../components/GenerateForm.vue"
import TopBar from "../components/TopBar.vue"
import CardUniqueQR from "../components/CardUniqueQR.vue"

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
      id: 0

    }
  },

  created: function() {
    this.id = this.$route.params.id;
    this.debouncedserveQR = _.debounce(this.serveQR, 500)
  },
  methods: {
   
    serveQR: _.debounce( function (message) {
      var vm = this
      this.short_url = message
      this.generated = true
      axios.get('https://yesno.wtf/api')
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
