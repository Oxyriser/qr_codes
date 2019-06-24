<template>
  <div class="home">
    <TopBarHome class="">
    </TopBarHome>
    <ListCard class="" :ids="shorts"></ListCard>    
  </div>
  
</template>

<script>
// @ is an alias to /src
import _ from 'lodash'
import axios from 'axios'
import TopBarHome from "../components/TopBarHome.vue"
import ListCard from "../components/ListCard.vue"

export default {
  components: {
    ListCard,
    TopBarHome
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
  created: function() {
    this.get_QR()
  },
  methods: {
    get_QR: function() {
      var vm = this
      this.test = "yes?"
      axios.get('https://jsonplaceholder.typicode.com/posts')
        .then(function (response) {
          console.log(response)
          vm.shorts = response.data.map(function(post) {return post.title})
          vm.test= "yeah!"
          console.log(vm.shorts)
        })
        .catch(function (error) {
          vm.test ="honoooo"
        })

    }
  }
};
</script>
