<template>
  <div>
    <div class="amap-page-container">
      <el-amap
        ref="map"
        vid="amapDemo"
        :amap-manager="amapManager"
        :center="center"
        :zoom="zoom"
        :plugin="plugin"
        :events="events"
        class="amap-demo"
      >
      </el-amap>
    </div>
  </div>
</template>
<script>
// Import AMapManager 
import { AMapManager } from "vue-amap";
let amapManager = new AMapManager();

// Get instance
import Vue from "vue";
import VueAMap from "vue-amap"
Vue.use(VueAMap);

// Initialize vue-amap
VueAMap.initAMapApiLoader({
  key: "d8488789f28d0ea005ec92e21fbf2c23",
  plugin: ["AMap.Autocomplete", "AMap.Geocoder", "AMap.Geolocation"],
  v: "1.4.4",
});

let Geocoder;
export default {
  data() {
    let self = this;
    return {
      amapManager,
      zoom: 12,
      center: [120.19, 30.26],
      events: {
        init: (o) => {
          o.getCity((result) => {
            console.log(result);
          });
        },
        click: (e) => {
         console.log(e)
        },
      },
    };
  },
};
</script>
<style scoped>
.amap-page-container {
  width: 1440px;
  height: 750px;
  margin: 0px 20px;
  border: rgb(170, 165, 165);
  border-style:solid;
  border-width:5px;
}
</style>