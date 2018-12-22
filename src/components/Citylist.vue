<template>
 <el-container>
<el-header>
    <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <router-link to="/index" style="float:left;text-decoration:none" class="el-icon-back">
         
        </router-link>
        城市信息表
        <el-button  type="primary" style="padding: 3px 4px 3px 4px;margin: 2px;float:right" size="mini"
                           @click="add()">添加
        </el-button>   </h1>
    
</el-header>
<el-main>
   <el-table
   order size="mini" fit highlight-current-row height="340" :data='tableDate.slice((currentpage-1)*pagesize,currentpage*pagesize)'>
    <el-table-column label="id" prop='id'></el-table-column>
    <el-table-column label='name' prop='name'></el-table-column>
    <el-table-column label='state' prop='state'></el-table-column>
    <el-table-column
              fixed="right"
              label="操作"
              width="195">
    <template slot-scope="scope">
                <el-button @click="upd(scope.row)" style="padding: 3px 4px 3px 4px;margin: 2px"
                           size="mini">编辑
                </el-button>
                <el-button type="danger" style="padding: 3px 4px 3px 4px;margin: 2px" size="mini"
                           @click="del(scope.row)">删除
                </el-button>        
    </template>
    </el-table-column>
   </el-table> 
   <el-pagination
        layout="prev, pager, next"
        @current-change="current_change"
        :total="citytotal"
        :current-page="currentpage"
        :page-size="pagesize" 
        background
                    >
   </el-pagination>
   </el-main>
     <el-form :model="city"  ref="updateCityForm" style="margin: 0px;padding: 0px;">
    <el-dialog title="城市详情" :visible.sync="showFlag" style="width:1000px;height:800px;margin:0 auto">
      <el-row>
            <el-col :span="6">
              <div>
                <el-form-item label="id:" prop="id">
                  <el-input readonly prefix-icon="el-icon-edit" v-model="city.id" size="mini" style="width: 150px"
                            placeholder="id"></el-input>
                </el-form-item>
              </div>
            </el-col>
            <el-col :span="6">
              <div>
                <el-form-item label="name:" prop="name">
                  <el-input prefix-icon="el-icon-edit" v-model="city.name" size="mini" style="width: 150px"
                            placeholder="name"></el-input>
                </el-form-item>
              </div>
            </el-col>
              <el-col :span="6">
              <div>
                <el-form-item label="state:" prop="state">
                  <el-input prefix-icon="el-icon-edit" v-model="city.state" size="mini" style="width: 150px"
                            placeholder="state"></el-input>
                </el-form-item>
              </div>
            </el-col>   
      </el-row>
       <div> 
            <el-button @click="updatecity('updateCityForm')">更新</el-button>
        </div>
    </el-dialog>
     </el-form>
     <el-form :model="city" :rules="rules"  ref="addCityForm" style="margin: 0px;padding: 0px;">
    <el-dialog title="添加城市"  :visible.sync="showFlag2" style="width:1000px;height:800px;margin:0 auto">
      <el-row>
            <el-col :span="6">
              <div>
                <el-form-item label="name:" prop="name">
                  <el-input prefix-icon="el-icon-edit" v-model="city.name" size="mini" style="width: 150px"
                            placeholder="name"></el-input>
                </el-form-item>
              </div>
            </el-col>
              <el-col :span="6">
              <div>
                <el-form-item label="state:" prop="state">
                  <el-input prefix-icon="el-icon-edit" v-model="city.state" size="mini" style="width: 150px"
                            placeholder="state"></el-input>
                </el-form-item>
              </div>
            </el-col>   
      </el-row>
       <div> 
            <el-button @click="addcity('addCityForm')">添加</el-button>
        </div>
    </el-dialog>
     </el-form>

 </el-container>
</template>
<script>
export default {
    data(){
        return{
            tableDate:[],
            city:{id:'',name:'',state:''},
            showFlag:false,
            showFlag2:false,
            citytotal:0,
            pagesize:5,
            currentpage:1,
            rules:{
                name:[  
                        { required: true, message: '请输入省份', trigger: 'blur' },
                        { min: 3, max: 5, message: '长度在 3 到 5 个字符', trigger: 'blur' }
                    ],
                state:[
                        { required: true, message: '请输入城市', trigger: 'blur' },
                        { min: 3, max: 5, message: '长度在 3 到 5 个字符', trigger: 'blur' }
                    ]
            }
           
        }
    },
    mounted: function () {
        //GET /someUrl
        this.initData();
        },
        methods:{
        //初始化城市列表
        initData(){
             this.$http.get('/api/city').then(response => {
              console.log(response.data);
             this.tableDate=response.data.citys;
             this.citytotal=response.data.count;
             this.someData = response.body;

         }, response => {
             console.log("error");
         });
        },
        //更新城市列表
        upd(row){
            this.$http.get('/api/city/'+row.id).then(response => {
            //console.log(response.data);
            this.city.id=response.data.city.id;
            this.city.name=response.data.city.name;
            this.city.state=response.data.city.state;
           // console.log(this.city);
            this.showFlag=true;
         }, response => {
             console.log("error");
         });
        },
        //删除选中城市
        del(row){
            this.$http.delete('/api/city/'+row.id).then(response=>{
                console.log(response.data);
                this.initData();
            });
        },
        //保存
        updatecity(formname){
            //console.log(formname);
            var _this=this;
            this.$refs[formname].validate((valid) => {
                if(valid){
                   _this.$http.put('/api/city',this.city).then(response=>{
                       console.log(response.data);
                    _this.initData();
                    _this.showFlag=false;
                   }); 
                }
            });
        },
        //显示新增页面
        add(){
            this.showFlag2=true;
        },
        //新增城市
        addcity(formname){
              var _this=this;
            this.$refs[formname].validate((valid) => {
                if(valid){
                    console.log(this.city);
                    _this.$http.post('/api/city',this.city).then(response=>{
                        console.log(response.data);
                     _this.initData();
                     _this.showFlag2=false;
                    }); 
                }
            });
        
        },
        //分页
        current_change(currentpage){
         this.currentpage=currentpage;
        
    }
    }
   

}
</script>
>
