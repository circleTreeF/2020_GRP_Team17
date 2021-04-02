<template>
  <div id="fh5co-page">
    <!-- Menu -->
    <aside id="fh5co-aside" role="complementary" class="border js-fullheight">
      <h1 id="fh5co-logo">Monitoring System</h1>
      <nav id="fh5co-main-menu" role="navigation">
        <ul>
          <li class="fh5co-active"><router-link to="Login">Home</router-link></li>
          <li><router-link to="Map">Map</router-link></li>
        </ul>
      </nav>
      <div class="fh5co-footer">
        <p>
          <small>
            <span>&copy; GRP Team 17. All Rights Reserved.</span>
            <span>Made by Shihui QUE </span>
            <span>Demo Images: Pixabay</span>
          </small>
        </p>
      </div>
    </aside>

    <div id="fh5co-main">
      <aside id="fh5co-hero">
        <div class="flexslider js-fullheight">
          <!-- <ul class="slides"> -->
          <ul>
            <li style="background-image: url(../assets/img_bg_1.jpg);">
              <div class="overlay"></div>
              <div class="container-fluid">
                <div class="row">
                  <div class="slider-text-inner">
                    <h1 style="color:white;letter-spacing: 3px;font-size:50px;">
                      {{ title }}
                    </h1>
                    
                    <el-form
                      ref="form"
                      :model="form"
                      label-width="80px"
                      class="login-form"
                    >
                      <el-form-item label="Username">
                        <el-input v-model="form.username"></el-input>
                      </el-form-item>
                      <el-form-item label="Password">
                        <el-input
                          v-model="form.password"
                          type="password"
                        ></el-input>
                      </el-form-item>
                      <el-form-item label="Verify">
                        <!-- test 6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI -->
                        <!-- real 6LdXOosaAAAAAOL854r3D_YqfpDxBXHR49q9lIKe -->
                          <vue-recaptcha ref="recaptcha"
                            @verify="onVerify" sitekey="6LdXOosaAAAAAOL854r3D_YqfpDxBXHR49q9lIKe">
                          </vue-recaptcha>
                      </el-form-item>
                        <el-button class="login-button" @click="login">{{title}}</el-button>
                        <div class="register" v-if="title=='LOGIN'">
                          <span>No account yet ? Go to</span>
                          <button @click="changeView()">Register</button>
                        </div>
                        <div class="register" v-if="title=='REGISTER'">
                          <span>Already have an account? Go to</span>
                          <button @click="changeView()">Login</button>
                        </div>
                    </el-form>
                  </div>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </aside>
    </div>
  </div>
</template>
<script>
import axios from "axios";
import VueRecaptcha from "vue-recaptcha";

export default {
  components: { VueRecaptcha },
  data() {
    return {
      url: "http://10.6.2.61:8866/statistics/web/user/",
      form: {
        username: "",
        password: "",
        robot:false
      },
      title: "LOGIN"
    };
  },
  methods: {
    login() {
      if (this.form.username == "" || this.form.password == "") {
        this.$message({
          message: "Username and password can not be empty",
          type: "warning"
        });
        return;
      }

      if (!this.form.robot) {
        this.$message({
          message: "Please check the verification box",
          type: "warning"
        });
        return;
      }
      var type = '';
      if (this.title == "LOGIN") {
        type = "login";
      } else {
        type = "register";
      }
      var url = this.url + type;
      console.log(url)

      const headerJSON = { "Content-Type": "application/json" };
      var data = {
        username: this.form.username,
        password: this.form.password
      };
      axios({
        method: "post",
        url: url,
        data: JSON.stringify(data),
        header: headerJSON
      })
        .then(response => {
          var res = response.data;
          console.log(res);
          if (res.result) {
            if (this.title=="REGISTER") {
               this.$message({
                message: 'Registered succeccfully, please login',
                type: 'success',
              })
              this.$router.go(0);
              return;
            }
            sessionStorage.setItem("requireAuth", false);
            sessionStorage.setItem("permission", this.form.name);
            this.$router.push("Map");
          } else {
            this.$message({
              message: "ERROR! " + res.message,
              type: "warning"
            });
          }
        })
        .catch(function(error) {
          // request fail

          alert(error);
          console.log(error);
        });

      // if(this.form.username == "admin" && this.form.password == "passwd") {
      //     sessionStorage.setItem('loginInfo', true)
      //     sessionStorage.setItem('permission', this.form.name)
      //     this.$message({
      //         message: '登录成功！',
      //         type: 'success',
      //     })
      //     this.$router.push('/components/Map');
      // } else{
      //     sessionStorage.setItem('loginInfo', false)
      //     this.$message({
      //         message: 'ERROR! Incorrect username or password',
      //         type: 'warning'
      //     })
      // }
    },

    changeView() {
      // url = this.url + "login";
      if (this.title == "LOGIN") {
        this.title = "REGISTER";
      } else {
        this.title = "LOGIN";
      }
    },
    onVerify(response) {
      if (response) {
        this.form.robot = true;
      }
    }
  }
};
</script>

<style acoped>
.login-form {
  width: 30vw;
  margin: 25vh auto; /* 上下间距160px，左右自动居中*/
  background-color: rgb(255, 255, 255, 0.8); /* 透明背景色 */
  padding: 30px 30px 10px 30px;
  border-radius: 20px; /* 圆角 */
  /* height: (window).height(); */
}

/* 背景 */
.login-container {
  /* position: absolute; */
  width: 100%;
  height: 100%;
}

/* 标题 */
.login-title {
  color: #303133;
  text-align: center;
  margin-bottom: 50px;
}

.login-button{
  background-color: rgb(241, 241, 241) ;
  color: #000;
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  font-weight: 700;
  margin: 0, auto;
  border-radius: 20px;
  width: 40%;
  border: 2px solid #aca8a8;

}

.register{
  margin: 20px 0 0 0;
}

.register > button{
  color: rgb(124, 185, 243);
  border-style: none;
  outline: none;
  background-color: Transparent; 
}



/* ======================================================== */

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

#fh5co-hero {
  /* height: 7500px; */
  background: #fff url(../assets/img_bg_1.jpg) no-repeat center fixed;
  background-size: cover;
  width: 100%;
  height: 100%;
  float: left;
  clear: both;
}
#fh5co-hero .btn {
  font-size: 24px;
}
#fh5co-hero .btn.btn-primary {
  padding: 14px 30px !important;
}
#fh5co-hero .flexslider {
  border: none;
  z-index: 1;
  margin-bottom: 0;
  height: 800px;
  width: 100%;
}
#fh5co-hero .flexslider .slides .overlay {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  content: "";
  background: rgba(0, 0, 0, 0.7);
}
#fh5co-hero .flexslider .slides li {
  background-repeat: no-repeat;
  background-size: cover;
  background-position: bottom center;
  min-height: 500px;
  position: relative;
}
#fh5co-hero .flexslider .flex-control-nav {
  /* bottom: 20px; */
  z-index: 1000;
  right: 20px;
  float: right;
  width: auto;
}
#fh5co-hero .flexslider .flex-control-nav li {
  display: block;
  /* margin-bottom: 10px; */
}
#fh5co-hero .flexslider .flex-control-nav li a {
  background: rgba(255, 255, 255, 0.2);
  box-shadow: none;
  width: 12px;
  height: 12px;
  cursor: pointer;
}
#fh5co-hero .flexslider .flex-control-nav li a.flex-active {
  cursor: pointer;
  background: transparent;
  border: 2px solid #228896;
}
#fh5co-hero .flexslider .flex-direction-nav {
  display: none;
}
#fh5co-hero .flexslider .slider-text {
  display: table;
  opacity: 0;
  min-height: 500px;
  z-index: 9;
}
#fh5co-hero .flexslider .slider-text > .slider-text-inner {
  display: table-cell;
  vertical-align: middle;
  min-height: 700px;
  padding: 2em;
}
@media screen and (max-width: 768px) {
  #fh5co-hero .flexslider .slider-text > .slider-text-inner {
    text-align: center;
  }
}
#fh5co-hero .flexslider .slider-text > .slider-text-inner h1,
#fh5co-hero .flexslider .slider-text > .slider-text-inner h2 {
  margin: 0;
  padding: 0;
  color: white;
  font-family: "Roboto", Arial, sans-serif;
}
#fh5co-hero .flexslider .slider-text > .slider-text-inner h1 {
  margin-bottom: 20px;
  font-size: 45px;
  line-height: 1.3;
  font-weight: 100;
  font-family: "Roboto", Arial, sans-serif;
}
@media screen and (max-width: 768px) {
  #fh5co-hero .flexslider .slider-text > .slider-text-inner h1 {
    font-size: 28px;
  }
}
#fh5co-hero .flexslider .slider-text > .slider-text-inner h2 {
  font-size: 18px;
  line-height: 1.5;
  margin-bottom: 30px;
  font-weight: 300;
}
#fh5co-hero .flexslider .slider-text > .slider-text-inner h2 a {
  color: rgba(34, 136, 150, 0.8);
  border-bottom: 1px solid rgba(34, 136, 150, 0.7);
}
#fh5co-hero .flexslider .slider-text > .slider-text-inner .heading-section {
  font-size: 50px;
}
@media screen and (max-width: 768px) {
  #fh5co-hero .flexslider .slider-text > .slider-text-inner .heading-section {
    font-size: 30px;
  }
}
#fh5co-hero .flexslider .slider-text > .slider-text-inner s .fh5co-lead {
  font-size: 20px;
  color: #fff;
}
#fh5co-hero
  .flexslider
  .slider-text
  > .slider-text-inner
  s
  .fh5co-lead
  .icon-heart {
  color: #d9534f;
}
#fh5co-hero .flexslider .slider-text > .slider-text-inner .btn {
  font-size: 12px;
  text-transform: uppercase;
  letter-spacing: 2px;
  color: #fff;
  padding: 22px 30px !important;
  border: none;
  font-weight: 500;
}
#fh5co-hero .flexslider .slider-text > .slider-text-inner .btn.btn-learn {
  background: #fff;
  color: #000;
}
#fh5co-hero .flexslider .slider-text > .slider-text-inner .btn.btn-learn:hover {
  color: #fff;
}
@media screen and (max-width: 768px) {
  #fh5co-hero .flexslider .slider-text > .slider-text-inner .btn {
    width: 100%;
  }
}

.container-fluid {
  margin-right: auto;
  margin-left: auto;
  padding-left: 15px;
  padding-right: 15px;
}
.container-fluid:before,
.container-fluid:after {
  content: " ";
  display: table;
}
.container-fluid:after {
  clear: both;
}

.container > .navbar-header,
.container > .navbar-collapse,
.container-fluid > .navbar-header,
.container-fluid > .navbar-collapse {
  margin-right: -15px;
  margin-left: -15px;
}
@media (min-width: 768px) {
  .container > .navbar-header,
  .container > .navbar-collapse,
  .container-fluid > .navbar-header,
  .container-fluid > .navbar-collapse {
    margin-right: 0;
    margin-left: 0;
  }
}

@media (min-width: 768px) {
  .navbar > .container .navbar-brand,
  .navbar > .container-fluid .navbar-brand {
    margin-left: -15px;
  }
}

@media screen and (min-width: 768px) {
  .jumbotron {
    padding-top: 48px;
    padding-bottom: 48px;
  }
  .container .jumbotron, .container-fluid .jumbotron {
    padding-left: 60px;
    padding-right: 60px;
  }
  .jumbotron h1,
  .jumbotron .h1 {
    font-size: 63px;
  }
}

.container .jumbotron, .container-fluid .jumbotron {
  border-radius: 6px;
}
.row {
  margin-left: -15px;
  margin-right: -15px;
}
.row:before,
.row:after {
  content: " ";
  display: table;
}
.row:after {
  clear: both;
}

@media (min-width: 992px) {
  .col-md-1,
  .col-md-2,
  .col-md-3,
  .col-md-4,
  .col-md-5,
  .col-md-6,
  .col-md-7,
  .col-md-8,
  .col-md-9,
  .col-md-10,
  .col-md-11,
  .col-md-12 {
    float: left;
  }

  .col-md-1 {
    width: 8.33333%;
  }

  .col-md-2 {
    width: 16.66667%;
  }

  .col-md-3 {
    width: 25%;
  }

  .col-md-4 {
    width: 33.33333%;
  }

  .col-md-5 {
    width: 41.66667%;
  }

  .col-md-6 {
    width: 50%;
  }

  .col-md-7 {
    width: 58.33333%;
  }

  .col-md-8 {
    width: 66.66667%;
  }

  .col-md-9 {
    width: 75%;
  }

  .col-md-10 {
    width: 83.33333%;
  }

  .col-md-11 {
    width: 91.66667%;
  }

  .col-md-12 {
    width: 100%;
  }

  .col-md-pull-0 {
    right: auto;
  }

  .col-md-pull-1 {
    right: 8.33333%;
  }

  .col-md-pull-2 {
    right: 16.66667%;
  }

  .col-md-pull-3 {
    right: 25%;
  }

  .col-md-pull-4 {
    right: 33.33333%;
  }

  .col-md-pull-5 {
    right: 41.66667%;
  }

  .col-md-pull-6 {
    right: 50%;
  }

  .col-md-pull-7 {
    right: 58.33333%;
  }

  .col-md-pull-8 {
    right: 66.66667%;
  }

  .col-md-pull-9 {
    right: 75%;
  }

  .col-md-pull-10 {
    right: 83.33333%;
  }

  .col-md-pull-11 {
    right: 91.66667%;
  }

  .col-md-pull-12 {
    right: 100%;
  }

  .col-md-push-0 {
    left: auto;
  }

  .col-md-push-1 {
    left: 8.33333%;
  }

  .col-md-push-2 {
    left: 16.66667%;
  }

  .col-md-push-3 {
    left: 25%;
  }

  .col-md-push-4 {
    left: 33.33333%;
  }

  .col-md-push-5 {
    left: 41.66667%;
  }

  .col-md-push-6 {
    left: 50%;
  }

  .col-md-push-7 {
    left: 58.33333%;
  }

  .col-md-push-8 {
    left: 66.66667%;
  }

  .col-md-push-9 {
    left: 75%;
  }

  .col-md-push-10 {
    left: 83.33333%;
  }

  .col-md-push-11 {
    left: 91.66667%;
  }

  .col-md-push-12 {
    left: 100%;
  }

  .col-md-offset-0 {
    margin-left: 0%;
  }

  .col-md-offset-1 {
    margin-left: 8.33333%;
  }

  .col-md-offset-2 {
    margin-left: 16.66667%;
  }

  .col-md-offset-3 {
    margin-left: 25%;
  }

  .col-md-offset-4 {
    margin-left: 33.33333%;
  }

  .col-md-offset-5 {
    margin-left: 41.66667%;
  }

  .col-md-offset-6 {
    margin-left: 50%;
  }

  .col-md-offset-7 {
    margin-left: 58.33333%;
  }

  .col-md-offset-8 {
    margin-left: 66.66667%;
  }

  .col-md-offset-9 {
    margin-left: 75%;
  }

  .col-md-offset-10 {
    margin-left: 83.33333%;
  }

  .col-md-offset-11 {
    margin-left: 91.66667%;
  }

  .col-md-offset-12 {
    margin-left: 100%;
  }
  .text-center {
    text-align: center;
  }


}
</style>
