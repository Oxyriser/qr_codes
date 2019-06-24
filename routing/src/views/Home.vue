<template>
  <div class="home">
    <h1>Home</h1>
    <h2>{{test}}</h2>
    <router-link to="front"> Nouveau </router-link>
    <router-link to='/me/stats'> Statistiques </router-link>

    <ListCard class="" :ids="shorts"></ListCard>    
  </div>
  
</template>

<script>
// @ is an alias to /src
import _ from 'lodash'
import axios from 'axios'
import TopBar from "../components/TopBar.vue"
import ListCard from "../components/ListCard.vue"

export default {
  components: {
    ListCard
  },
  data: function () {
    return {
      input: "https://www.youtube.com/watch?v=6n3pFFPSlW4",
      shorts: [
        'foo',
        'bar',
        'test'
      ],
      test: "nope"
    }
  },
  beforeCreate: function() {
    this.debounced_getQRs = _.debounce(this.get_QRs, 1000)
    test = "noppyyy"
    this.get_QRs()
    
  },
  methods: {
    get_QRs: function() {
      var vm = this
      this.test = "yes?"
      axios.get('https://jsonplaceholder.typicode.com/posts')
        .Then(function (response) {
          vm.shorts = response.map(function(post) {return post.title})
          vm.test= "yeah!"
        })
        .catch(function (error) {
          vm.test ="honoooo"
        })

    }
  }
};
</script>
