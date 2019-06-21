<template>
  <div class="home">
    <h1>Home</h1>
    <router-link to="front"> Nouveau </router-link>
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
    }
  }
};
</script>
