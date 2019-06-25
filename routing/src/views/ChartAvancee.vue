<template>
  <div id="myChart">
    <TopBar class=""></TopBar><br><br>

    <br><br>
    <button @click="getJson">Json Test</button>&nbsp;
    <button @click="getJsonByPost">Json Test2</button>
    <br><br>

    <h3>Show which QR code information?</h3><br>
    <!--Drop down box-->
    <div class="selectBox" style="border-style: solid;border-width: 5px;border-color: black;background-color: black;color: white;width: 300px;margin: auto;">
      <div class="selectBox_show" v-on:click.stop="arrowDown">
        <p>{{unitName}}</p>
        <input type="hidden" name="unit" v-model="unitModel">
      </div>
      <div class="selectBox_list" v-show="isShowSelect">
        <div class="selectBox_listLi" v-for="(item, index) in dataList"
             @click.stop="select(item, index)">{{item.value}}
        </div>
      </div>
    </div><br><br>
    <!--Close drop down box-->
    <!--<button id="ourButton" @click="drawChart">Show some datas</button><br><br>-->
    <button id="ourSmallButton" @click="modeWeek">Per week</button>&nbsp
    <button id="ourSmallButton" @click="modeMonth">Per month</button><br><br>
    <div id="main"></div>
  </div>
</template>

<script>
import TopBar from "../components/TopBar.vue"
import axios from 'axios'
export default {
  name: 'Chart',
  components: {
    TopBar
  },
  props: {

  },
  data: function () {
    return {
      msg: {},
      v1: '',
      mode: 0,
      posts: [],
      postBody: 'This is a test!',
      postInfo: [],
      errors: [],
      // Drop down box
      nbQR: '',
      unitModel: '',
      isShowSelect: false,
      dataList: [],
      unitName: 'Choose the number of your QR code'
      // -------------------------------------
    }
  },
  methods: {
    modeWeek () {
      this.mode = 0
      this.drawChart()
    },
    modeMonth () {
      this.mode = 1
      this.drawChart()
    },
    getData () {
      // Lection du json
      var url = 'test2.json'
      var vm = this
      this.$http.get(url).then(res => {
        console.log(res.data)
        vm.msg = res.data.DATA[1]
        // Drop down box
        this.nbQR = res.data.DATA[0].nbQRtt
        this.addData()
        // -----------------------------------
      })
      .catch(function (error) {
            vm.answer = 'Error! Could not reach the API. ' + error
            })
    },
    getJson () {
      axios.get(`http://jsonplaceholder.typicode.com/users/1`)
      .then(response => {
        // JSON responses are automatically parsed.
        this.users = response.data
        console.log(this.users)
      })
      .catch(e => {
        this.errors.push(e)
      })
    },
    getJsonByPost () {
      axios.post(`http://jsonplaceholder.typicode.com/posts`, {
        body: this.postBody
      })
      .then(response => {
        this.postInfo = response.data
        console.log(this.postInfo)
      })
      .catch(e => {
        this.errors.push(e)
      })
    },
    // Drop down box
    addData () {
      var i = 0
      for (i = 0; i < this.nbQR; i++) {
        this.dataList.push({ key: i, value: 'Number ' + i })
      }
    },
    arrowDown () {
      this.isShowSelect = !this.isShowSelect
    },
    select (item, index) {
      this.isShowSelect = false
      console.log(item)
      console.log(index)
      this.v1 = index
      this.unitModel = index
      this.unitName = item.value
    },
    // -----------------------------------
    drawChart () {
      console.log('?????' + this.v1)
      // Initialize the echarts instance based on the prepared dom
      let myChart = this.$echarts.init(document.getElementById('main'))
      if (this.mode) {
        // Specify configuration items and data for the chart of month
        let option = {
          title: {
            text: 'Statistics'
          },
          tooltip: {},
          legend: {
            data: ['Number of views']
          },
          xAxis: {
            data: ['JAV', 'FEV', 'MAR', 'AVR', 'MAI', 'JUN', 'JUI', 'AOU', 'SEP', 'OCT', 'NOV', 'DEC']
          },
          yAxis: {},
          series: [
            {
              name: 'Number of views',
              type: 'bar',
              data: [
                Number(this.msg.QR[this.v1].nb_vue_month[0].JAN),
                Number(this.msg.QR[this.v1].nb_vue_month[0].FEV),
                Number(this.msg.QR[this.v1].nb_vue_month[0].MAR),
                Number(this.msg.QR[this.v1].nb_vue_month[0].AVR),
                Number(this.msg.QR[this.v1].nb_vue_month[0].MAI),
                Number(this.msg.QR[this.v1].nb_vue_month[0].JUN),
                Number(this.msg.QR[this.v1].nb_vue_month[0].JUI),
                Number(this.msg.QR[this.v1].nb_vue_month[0].AOU),
                Number(this.msg.QR[this.v1].nb_vue_month[0].SEP),
                Number(this.msg.QR[this.v1].nb_vue_month[0].OCT),
                Number(this.msg.QR[this.v1].nb_vue_month[0].NOV),
                Number(this.msg.QR[this.v1].nb_vue_month[0].DEC)
              ]
            }
          ]
        }
        myChart.setOption(option)
      } else {
        // Specify configuration items and data for the chart of week
        let option = {
          title: {
            text: 'Statistics'
          },
          tooltip: {},
          legend: {
            data: ['Number of views']
          },
          xAxis: {
            data: ['LUN', 'MAR', 'MER', 'JEU', 'VEN', 'SAM', 'DIM']
          },
          yAxis: {},
          series: [
            {
              name: 'Number of views',
              type: 'bar',
              data: [
                Number(this.msg.QR[this.v1].nb_vue_week[0].LUN),
                Number(this.msg.QR[this.v1].nb_vue_week[0].MAR),
                Number(this.msg.QR[this.v1].nb_vue_week[0].MER),
                Number(this.msg.QR[this.v1].nb_vue_week[0].JEU),
                Number(this.msg.QR[this.v1].nb_vue_week[0].VEN),
                Number(this.msg.QR[this.v1].nb_vue_week[0].SAM),
                Number(this.msg.QR[this.v1].nb_vue_week[0].DIM)
              ]
            }
          ]
        }
        myChart.setOption(option)
      }
    }
  },
  mounted () {
    this.getData()
  }
}
</script>

<style>
#myChart {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
#main {
  width: 600px;
  height:400px;
  margin: auto;
}
#ourButton {
  background-color: black;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
#ourSmallButton {
  background-color: black;
    border: none;
    color: white;
    padding: 12px 26px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
#selectBox_list{
    max-height: 240px;
    width: 398px;
    display: block;
}
</style>
