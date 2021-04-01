<template>
  <div class="login-container">
    <aside id="fh5co-aside" role="complementary" class="border js-fullheight">
      <h1 id="fh5co-logo">Road</h1>
      <nav id="fh5co-main-menu" role="navigation">
        <ul>
          <li class="fh5co-active"><a href="index.html">Home</a></li>
          <li><a href="about.html">About</a></li>
          <li><router-link to="/Map">Map</router-link></li>
        </ul>
      </nav>
    </aside>
    <h1 style="color:#4682B4">Road Monitoring System</h1>

    <el-form ref="form" :model="form" label-width="80px" class="login-form">
      <!-- <h2 class="login-title">Road Monitoring System</h2> -->
      <el-form-item label="Username">
        <el-input v-model="form.username"></el-input>
      </el-form-item>
      <el-form-item label="Password">
        <el-input v-model="form.password" type="password"></el-input>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" @click="login">Login</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
import axios from "axios";

export default {
  data() {
    return {
      url: "http://10.6.2.61:8866/statistics/user_login",
      form: {
        username: "",
        password: ""
      }
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

      const headerJSON = { "Content-Type": "application/json" };
      var data = {
        username: this.form.username,
        password: this.form.password
      };
      axios({
        method: "post",
        url: this.url,
        data: JSON.stringify(data),
        header: headerJSON
      })
        .then(response => {
          var res = response.data.result;
          console.log(res);
          if (res) {
            sessionStorage.setItem("loginInfo", true);
            sessionStorage.setItem("permission", this.form.name);
            this.$router.push("/components/Map");
          } else {
            sessionStorage.setItem("loginInfo", false);
            this.$message({
              message: "ERROR! Incorrect username or password",
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
    }
  }
};
</script>

<style acoped>
.login-form {
  width: 350px;
  margin: 100px auto; /* 上下间距160px，左右自动居中*/
  background-color: rgb(255, 255, 255, 0.8); /* 透明背景色 */
  padding: 30px;
  border-radius: 20px; /* 圆角 */
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
</style>


