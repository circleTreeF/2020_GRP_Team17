<template>
  <div class = "total-container">
    <h1 style="color:#4682B4">Road Monitoring System</h1>

    <el-date-picker
        class="date-picker"
        type="date"
        placeholder="select date"
        v-model="date"
        value-format="yyyy-MM-dd">
    </el-date-picker>

    <div class="amap-page-container">
      <el-amap
        ref="map"
        vid="amapDemo"
        :amap-manager="amapManager"
        :center="center"
        :zoom="zoom"
        class="amap-demo">
        <el-amap-circle v-for="(circle,index) in badPoints" 
          :key="index" 
          :center="circle.center" 
          :radius="circle.radius"
          :strokeColor= "circle.status ? '#7B68EE' : '#ee2200'"
          strokeOpacity= '1'  
          strokeWeight= '1'  
          :fillColor= "circle.status ? '#6A5ACD' : '#ee2200'"
          fillOpacity= '0.5'>
        </el-amap-circle>
      </el-amap>
    </div>
  </div>
</template>
<script>
// Import 
import { AMapManager } from "vue-amap";
import axios from 'axios';
import Vue from "vue";
import VueAMap from "vue-amap";

let amapManager = new AMapManager();

// Get instance
Vue.use(VueAMap);

// Initialize vue-amap
VueAMap.initAMapApiLoader({
  key: "d8488789f28d0ea005ec92e21fbf2c23",
  plugin: ["AMap.Autocomplete", 
    "AMap.Geocoder", 
    "AMap.Geolocation", 
    "AMap.CircleEditor"],
  v: "1.4.4"
});

let Geocoder;
export default {
  data() {
    return {
      url: "http://10.6.2.61:8866/statistics/get_bad_point",
      amapManager,
      zoom: 17,
      center: [121.562236, 29.8000444],
      date:'',
      badPoints: []
    };
  },

  // listener
  watch: {
    date: function (newDate, oldDate) {
     this.requestData(newDate);
    }
  },

  // First load
  created: function() {
    this.onload();
  },

  // methods
  methods: {

    // Gets bad points and renders page
    onload: function() {
      var nowDate = this.getNowFormatDate();
      this.requestData(nowDate);
    }, 


    // Requests bad points with parameter date 
    requestData: function(date) {
      const headerJSON = {"Content-Type": "application/json"};
      axios({
          method: "post",
          url: this.url,
          data: JSON.stringify({date: date}),
          header: headerJSON
        })
      .then(response => {
        var res = response.data
        if (res.length <= 0) {
          this.$message({
            type: "info",
            message: "NO DATA"
          });
        }
        this.changeFormat(res);
      })
      .catch(function (error) { // request fail
        console.log(error)
      })
    },


    // Converts format
    changeFormat: function(data) {
      var badPoints = [];
      var tempCenter = []
      var tempCircle = {}

      for (var i = 0; i < data.length; i++) {
        tempCenter.push(data[i].point_longitude)
        tempCenter.push(data[i].point_latitude)
        tempCircle = {
          'center': tempCenter,
          'radius': data[i].point_radius,
          'status': data[i].valid_status
        }
        console.log(tempCircle)
        badPoints.push(tempCircle)
        tempCenter = []
      }

      this.badPoints = badPoints
    },


    // Gets now date in YYYY-MM-DD format
    getNowFormatDate: function() {
      var  date =  new  Date();
      var  seperator1 =  "-" ;
      var  year = date.getFullYear();
      var  month = date.getMonth() + 1;
      var  strDate = date.getDate();
      if  (month >= 1 && month <= 9) {
        month =  "0"  + month;
      }
      if  (strDate >= 0 && strDate <= 9) {
        strDate =  "0"  + strDate;
      }
      var  currentdate = year + seperator1 + month + seperator1 + strDate;
      return  currentdate;
    }
  }
};
</script>
<style scoped>
.amap-page-container {
  width: 1300px;
  height: 700px;
  margin: 0px 80px;
  bottom: 100px;
  border: rgb(170, 165, 165);
  border-style: solid;
  border-width: 5px;
}

.date-picker {
  margin-bottom: 20px;
  width: 40%;

}

.total-container{
  /* margin: 0 60px; */
  padding: 0 0 200px 0; 
  width: 100%;
  height: 100%;
}
</style>
