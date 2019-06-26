<template>
  <div id="myChart">
    <h3>Show which QR code information?</h3><br>
    <input v-model="v1"/><br><br>
    <button id="ourButton" @click="drawChart">Show some datas</button><br><br>
    <div id="main"></div>
  </div>
</template>

<script>
export default {
  name: 'Chart',
  data () {
    return {
      msg: {},
      v1: ''
    }
  },
  methods: {
    getData () {
      // Lection du json
      var url = 'http://localhost:8080/static/test2.json'
      this.$http.get(url).then(res => {
        console.log(res.data)
        this.msg = res.data.DATA[1]
      })
    },
    drawChart () {
      console.log('?????' + this.v1)
      // 基于准备好的dom，初始化echarts实例
      let myChart = this.$echarts.init(document.getElementById('main'))
      // 指定图表的配置项和数据
      let option = {
        title: {
          text: 'Statique'
        },
        tooltip: {},
        legend: {
          data: ['Nb de vue']
        },
        xAxis: {
          data: ['LUN', 'MAR', 'MER', 'JEU', 'VEN', 'SAM', 'DIM']
        },
        yAxis: {},
        series: [
          {
            name: 'Nb de vue',
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
      // 使用刚指定的配置项和数据显示图表。
      myChart.setOption(option)
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
  margin-top: 60px;
}
#main {
  width: 600px;
  height:400px;
  margin: auto;
}
#ourButton {
  background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
</style>
