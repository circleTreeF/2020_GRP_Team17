<template>
  <!-- <div class = "total-container"> -->
  <div id="fh5co-page">

    <aside id="fh5co-aside" role="complementary" class="border js-fullheight">
      <h1 id="fh5co-logo">Monitoring System</h1>
      <nav id="fh5co-main-menu" role="navigation">
        <ul>
          <li><router-link to="Login">Home</router-link></li>
          <li class="fh5co-active"><router-link to="Map">Map</router-link></li>
        </ul>
      </nav>
      <div class="fh5co-footer">
				<p><small>
          <span>&copy; GRP Team 17. All Rights Reserved.</span> 
          <span>Made by Shihui QUE </span>
          <span>Demo Images: Pixabay</span>
        </small></p>
			</div>
    </aside>
		<div id="fh5co-main">

      <el-date-picker
        class="date-picker"
        type="date"
        placeholder="select date"
        v-model="date"
        value-format="yyyy-MM-dd">
      </el-date-picker>
  
      <!-- map language :lang= "language" -->
      <div class="amap-page-container">
        <el-amap
          ref="map"
          vid="amapDemo"
          :amap-manager="amapManager"
          :center="center"
          :zoom="zoom">
          <el-amap-circle v-for="(circle,index) in badPoints" 
            :key="index" 
            :center="circle.center" 
            :radius="circle.radius"
            :events="events"
            ref="circle"
            :strokeColor= "circle.status ? '#7B68EE' : '#ee2200'"
            strokeOpacity= '1'  
            strokeWeight= '1'  
            :fillColor= "circle.status ? '#6A5ACD' : '#ee2200'"
            fillOpacity= '0.5'>
          </el-amap-circle>
        </el-amap>
      </div>
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
  v: "1.4.4",

});

let Geocoder;
export default {
  data() {
    return {
      url: "http://10.6.2.61:8866/statistics/get/bad/points?date=",
      amapManager,
      zoom: 17,
      // language: "en",
      center: [121.562236, 29.8000444],
      date:'',
      badPoints: [],
      events: {
      click: e => {
        var message = "Position : [" + e.lnglat.lat + e.lnglat.lng +"]"
        this.$alert(message, 'Message', {
          confirmButtonText: 'OK',
        });
      }
    }
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
      axios
        .get(this.url + date )
        .then(response => {
          // console.log(response.data)
          var res = response.data
          if (res.length <= 0) {
            this.$message({
              type: "info",
              message: "NO DATA"
            });
          }
          this.changeFormat(res);
        })
        .catch(function (error) { // 请求失败处理
          this.$message({
            type: 'warning',
            message: '操作失败，请稍后再试'
          })
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
    },

    showCenter: function() {
      console.log("aaa")
      console.log(this.$refs.circle.$$getCenter())
    }
  }
};
</script>
<style scoped>
.amap-page-container {
  /* width: 1300px;
  height: 700px; */
  width: 100%;
  height: 85vh;
  /* margin: 0px 80px; */
  bottom: 100px;
  /* border: rgb(170, 165, 165); */
  /* border-style: solid; */
  /* border-width: 5px; */
  background: #fff url(../assets/img_bg_2.jpg) no-repeat center fixed; 
  background-size: cover;
  width: 100%;
  height: 100%;
  float: left;
  clear: both;
}

.date-picker {
  margin: 20px auto;
  width: 40%;
}

.total-container{
  /* margin: 0 60px; */
  /* padding: 0 0 200px 0;  */
  width: 100%;
  height: 100%;
}


.js-fullheight {
  height:100vh;
}
#fh5co-page {
  width: 100%;
  height:100vh;
  overflow: hidden;
  position: relative;
}

#fh5co-aside {
  padding-top: 60px;
  padding-bottom: 40px;
  width: 20%;
  position: fixed;
  bottom: 0;
  top: 0;
  left: 0;
  overflow-y: scroll;
  z-index: 1001;
  -webkit-transition: 0.5s;
  -o-transition: 0.5s;
  transition: 0.5s;
}
@media screen and (max-width: 1200px) {
  #fh5co-aside {
    width: 30%;
  }
}
@media screen and (max-width: 768px) {
  #fh5co-aside {
    width: 270px;
    -moz-transform: translateX(-270px);
    -webkit-transform: translateX(-270px);
    -ms-transform: translateX(-270px);
    -o-transform: translateX(-270px);
    transform: translateX(-270px);
  }
}
#fh5co-aside #fh5co-logo {
  text-align: center;
  font-family: "Roboto", Arial, sans-serif;
  font-weight: 700;
  margin-bottom: 2em;
  text-transform: uppercase;
  font-size: 38px;
}
@media screen and (max-width: 768px) {
  #fh5co-aside #fh5co-logo {
    margin-bottom: 1em;
  }
}
#fh5co-aside #fh5co-logo a {
  color: #000;
}
#fh5co-aside #fh5co-logo a span {
  font-weight: 300;
  color: rgba(0, 0, 0, 0.5);
}

#fh5co-aside #fh5co-main-menu ul {
  text-align: center;
  margin: 0;
  padding: 0;
}
@media screen and (max-width: 768px) {
  #fh5co-aside #fh5co-main-menu ul {
    margin: 0 0 2em 0;
  }
}
#fh5co-aside #fh5co-main-menu ul li {
  margin: 0 0 20px 0;
  padding: 0;
  list-style: none;
}
#fh5co-aside #fh5co-main-menu ul li a {
  color: rgba(0, 0, 0, 0.9);
  text-decoration: none;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  font-size: 13px;
  font-weight: 600;
  position: relative;
  padding: 10px 10px;
  letter-spacing: 0.2em;
  font-family: "Roboto", Arial, sans-serif;
  -webkit-transition: 0.3s;
  -o-transition: 0.3s;
  transition: 0.3s;
}
#fh5co-aside #fh5co-main-menu ul li a:after {
  content: "";
  position: absolute;
  height: 2px;
  bottom: 7px;
  left: 10px;
  right: 10px;
  background-color: #228896;
  visibility: hidden;
  -webkit-transform: scaleX(0);
  -moz-transform: scaleX(0);
  -ms-transform: scaleX(0);
  -o-transform: scaleX(0);
  transform: scaleX(0);
  -webkit-transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  -moz-transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  -ms-transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  -o-transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}
#fh5co-aside #fh5co-main-menu ul li a:hover {
  text-decoration: none;
  color: black;
}
#fh5co-aside #fh5co-main-menu ul li a:hover:after {
  visibility: visible;
  -webkit-transform: scaleX(1);
  -moz-transform: scaleX(1);
  -ms-transform: scaleX(1);
  -o-transform: scaleX(1);
  transform: scaleX(1);
}
#fh5co-aside #fh5co-main-menu ul li.fh5co-active a {
  color: black;
}
#fh5co-aside #fh5co-main-menu ul li.fh5co-active a:after {
  visibility: visible;
  -webkit-transform: scaleX(1);
  -moz-transform: scaleX(1);
  -ms-transform: scaleX(1);
  -o-transform: scaleX(1);
  transform: scaleX(1);
}

#fh5co-aside .fh5co-footer {
  position: absolute;
  bottom: 160px;
  font-size: 14px;
  text-align: center;
  width: 100%;
  font-weight: 400;
  color: rgba(0, 0, 0, 0.6);
}
@media screen and (max-width: 768px) {
  #fh5co-aside .fh5co-footer {
    position: relative;
    bottom: 0;
  }
}
#fh5co-aside .fh5co-footer span {
  display: block;
}
#fh5co-aside .fh5co-footer ul {
  padding: 0;
  margin: 0;
  text-align: center;
}
#fh5co-aside .fh5co-footer ul li {
  padding: 0;
  margin: 0;
  display: inline;
  list-style: none;
}
#fh5co-aside .fh5co-footer ul li a {
  color: rgba(0, 0, 0, 0.7);
  padding: 4px;
}
#fh5co-aside .fh5co-footer ul li a:hover,
#fh5co-aside .fh5co-footer ul li a:active,
#fh5co-aside .fh5co-footer ul li a:focus {
  text-decoration: none;
  outline: none;
  color: #228896;
}
#fh5co-main {
  /* background-color: rgba(214, 210, 210, 0.911); */
  width: 80%;
  height: 100%;
  float: right;
  -webkit-transition: 0.5s;
  -o-transition: 0.5s;
  transition: 0.5s;
}
@media screen and (max-width: 1200px) {
  #fh5co-main {
    width: 70%;
  }
}
@media screen and (max-width: 768px) {
  #fh5co-main {
    width: 100%;
  }
}
#fh5co-main .fh5co-narrow-content {
  position: relative;
  width: 93%;
  margin: 0 auto;
  padding: 4em 0;
  clear: both;
}
@media screen and (max-width: 768px) {
  #fh5co-main .fh5co-narrow-content {
    width: 100%;
    padding: 4em 1em;
  }
}


  

</style>
