<template>
  <div>
    <div class="amap-page-container">
      <el-amap
        ref="map"
        vid="amapDemo"
        :amap-manager="amapManager"
        :center="center"
        :zoom="zoom"
        class="amap-demo"
      >
        <el-amap-circle v-for="(circle,index) in badPoints" 
          :key="index" 
          :center="circle.center" 
          :radius="circle.radius"
          strokeColor= '#F33'
          strokeOpacity= '1'  
          strokeWeight= '1'  
          fillColor= '#ee2200'
          fillOpacity= '0.35'>
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
    let self = this;
    return {
      amapManager,
      zoom: 17,
      center: [121.562236, 29.8000444],
      // events: {
      //   init: o => {
      //     o.getCity(result => {
      //       console.log(result);
      //     });
      //   },
      //   click: e => {
      //     console.log(e);
      //   }
      // }
      badPoints: []
    };
  },

  // run when load
  created: function() {
    this.onload();
  },

  // methods
  methods: {
    // Gets bad points and renders page
    onload: function() {
      axios
        .get("http://10.6.2.61:8866/statistics/get_bad_point")
        .then(response => {
          var res = response.data;
          var badPoints = [];
          var tempCenter = []
          var tempCircle = {};

          // Converts format
          for (var i = 0; i < res.length; i++) {
            tempCenter.push(res[i].point_longitude)
            tempCenter.push(res[i].point_latitude)
            tempCircle = {
              'center': tempCenter,
              'radius': res[i].point_radius
            }
            console.log(tempCircle)
            badPoints.push(tempCircle)
            tempCenter = []
          }

          this.badPoints = badPoints
        })
    }
  }
};
</script>
<style scoped>
.amap-page-container {
  width: 1440px;
  height: 750px;
  margin: 0px 20px;
  border: rgb(170, 165, 165);
  border-style: solid;
  border-width: 5px;
}
</style>
