<template>
<el-container>
  <el-header width="400px">
    <Menu></Menu>
  </el-header>
      <el-main>
        <div style="width:1600px;float:right">
     <h2><img :src="headurl" style="wdith:80px;height:80px;border-radius:50px"> welcome！！！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户：{{userName}} </h2>
      <el-tabs type="border-card" style='width:1000px;margin:0 auto'>
      <el-tab-pane label="基本资料" >
        <!--基本资料  :model="user"-->
        <el-form ref="infoform" :model="user" label-width="80px">
          <el-form-item label="姓名" prop="name"  style='width:400px'>
              <el-input v-model="user.name"></el-input>
          </el-form-item>
           <el-form-item label="手机" prop="phone"  style='width:400px'>
              <el-input v-model="user.phone"></el-input>
          </el-form-item>
           <el-form-item label="年龄" prop="age"  style='width:400px'>
              <el-input v-model="user.age"></el-input>
          </el-form-item>
           <el-form-item label="部门" prop="deptposition"  style='width:400px'>
              <el-input v-model="user.deptposition"></el-input>
          </el-form-item>
           <el-form-item label="职位" prop="deptposition"  style='width:400px'>
              <el-input v-model="user.deptposition"></el-input>
          </el-form-item>
           <el-form-item label="性别" prop="sex" style='width:400px'>
              <el-radio-group v-model="sex" style="float: left;margin-top:10px">
                  <el-radio label="1" >男</el-radio>
                  <el-radio label="2" >女</el-radio>
              </el-radio-group>
          </el-form-item>
           <el-form-item label="地址" prop="address"  style='width:400px'>
              <el-input v-model="user.address"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" >保存</el-button>
            <el-button>更新</el-button>
          </el-form-item>
        </el-form>
        <!--基本资料-->
      </el-tab-pane>
      <el-tab-pane label="头像设置">
        <!--头像设置-->
        <h5 style='text-align:center'>添加或修改头像：</h5>
        <el-upload
        class="avatar-uploader"
        action='/api/userUpload'
        :show-file-list="false"
        :on-success="handleAvatarSuccess"
        :before-upload="beforeAvatarUpload" style='margin:0 auto'>
        <img v-if="imageUrl" :src="imageUrl" class="avatar">
      <i v-else class="el-icon-plus avatar-uploader-icon"></i>
      </el-upload>
        <!--头像设置-->
      </el-tab-pane>
      <el-tab-pane label="教育经历">
        <el-form ref="infoform" :model="user"  label-width="150px">
          <el-form-item label="小学" prop="education1" style='width:400px'>
              <el-input v-model="user.education1" ></el-input>
          </el-form-item>
           <el-form-item label="初中" prop="education2" style='width:400px'>
              <el-input v-model="user.education2"></el-input>
          </el-form-item>
           <el-form-item label="高中" prop="education3" style='width:400px'>
              <el-input v-model="user.education3"></el-input>
          </el-form-item>
           <el-form-item label="大学" prop="education4" style='width:400px'>
              <el-input v-model="user.education4"></el-input>
          </el-form-item>
           <el-form-item label="研究生及以上" prop="ishigheducation" style='width:400px'>
              <el-radio-group v-model="ishigheducation" style="float: left;margin-top:10px">
                  <el-radio label="0" >是</el-radio>
                  <el-radio label="1" >不是</el-radio>
              </el-radio-group>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" >保存</el-button>
            <el-button>更新</el-button>
          </el-form-item>
        </el-form>
      </el-tab-pane>
</el-tabs>
        </div>
      </el-main>
      <el-footer>author @jtniu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系我</el-footer>
</el-container>
</template>
<script>
import Menu from '@/components/menu';
export default {
  data () {
    return {
      userName:'',
      imageUrl: '',
      headurl:require("../assets/1546146191588.jpg"),
      user:{id:'',name:'',phone:'',deptposition:'',sex:"",address:'',age:'',education1:'',education1:'',education2:'',education3:'',education4:''},
      sex:"1",
      ishigheducation:'0',
      }
  },
  mounted:function(){
    this.initDate();
  },
  methods:{
    //初始化
    initDate(){
        this.$http.get('/api/logininfo').then(response => {
          console.log(response.data.logininfo)
              var logindate=response.data.logininfo;
             this.userName=logindate.username;
             this.showUserByLoginid(logindate.id);
         }, response => {
             console.log("error");
         });
    },
    //退出登录
    loginout(){
       this.$http.get('/api/loginout').then(response => {
              console.log(response.data.LoginStatus);
               this.$router.push({  //核心语句
            path:'/',   //跳转的路径
            });
         }, response => {
             console.log("error");
         });
    },
    //图片处理成功
    handleAvatarSuccess(res, file) {
        this.imageUrl = URL.createObjectURL(file.raw);
    },
    //上传之前校验
    beforeAvatarUpload(file) {
        const isJPG = file.type === 'image/jpeg';
        const isLt2M = file.size / 1024 / 1024 < 2;

        if (!isJPG) {
          this.$message.error('上传头像图片只能是 JPG 格式!');
        }
        if (!isLt2M) {
          this.$message.error('上传头像图片大小不能超过 2MB!');
        }
        return isJPG && isLt2M;
      },
      //显示登录账号的用户信息
      showUserByLoginid(id){
           this.$http.get('/api/user1/'+id).then(response => {
            //console.log(response.data);
            this.user=response.data.LoginUserStatus;
            console.log(this.user);
         }, response => {
             console.log("error");
         });
      }

  },
  components:{
    'Menu':Menu
  }
}
</script>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
    border:1px dotted #ccc;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }

</style>
