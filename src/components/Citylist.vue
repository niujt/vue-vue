<template>
 <el-container>
<el-header>
    <Menu></Menu>   
    <h1>
        城市信息表&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:10px">共{{citytotal}}条记录</span>
         </h1>
 
</el-header>
<el-main>
        <el-button  type="primary" style="padding: 3px 4px 3px 4px;margin: 2px;float:right" size="mini"
                           @click="add()">添加
        </el-button>  
    <div style="width:1560px;float:right">
   <el-table
   order size="mini" fit highlight-current-row height="340" :data='tableDate.slice((currentpage-1)*pagesize,currentpage*pagesize)'>
    <el-table-column type="index" label="序号"></el-table-column>
    <el-table-column label="id" prop='id' v-if='false' sortable></el-table-column>
    <el-table-column label='省(或者直辖市)' prop='provincename' sortable></el-table-column>
    <el-table-column label='市（区）' prop='cityname' sortable></el-table-column>
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
    </div>
   </el-main>
     <el-form :model="city"  ref="updateCityForm" style="margin: 0px;padding: 0px;">
    <el-dialog title="城市详情" :visible.sync="showFlag" width="60%"  style="margin:0 auto">
         <el-row>
                <el-row :span="5">
                <el-form-item label="编号:" prop="id">
                  <el-input readonly prefix-icon="el-icon-edit" v-model="city.id" size="mini" style="width: 150px"
                            placeholder="id"></el-input>
                </el-form-item>
                </el-row>
                 <el-row :span="5">
                 <el-form-item label="省份:" prop="provinceid">
                    <el-select v-model="city.provinceid"  clearable placeholder="请选择" size="mini" style="width:150px"  >
                        <el-option v-for="item in province" :key="item.id" :label="item.provincename" :value="item.id">
                        </el-option>
                    </el-select>
                </el-form-item>
                 </el-row>
                 <el-row :span="5">
                <el-form-item label="城市:" prop="cityname">
                  <el-input prefix-icon="el-icon-edit" v-model="city.cityname" size="mini" style="width: 150px"
                            placeholder="cityname"></el-input>
                </el-form-item>
                 </el-row>
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
                <el-form-item label="省份:" prop="provinceid">
                   <el-select v-model="city.provinceid"  clearable placeholder="请选择" size="mini" style="width:150px"  >
                        <el-option v-for="item in province" :key="item.id" :label="item.provincename" :value="item.id">
                        </el-option>
                    </el-select>
                </el-form-item>
              </div>
            </el-col>
              <el-col :span="6">
              <div>
                <el-form-item label="市:" prop="cityname">
                  <el-input prefix-icon="el-icon-edit" v-model="city.cityname" size="mini" style="width: 150px"
                            placeholder="市"></el-input>
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
import Menu from '@/components/menu';
export default {
    data(){
        return{
            tableDate:[],
            city:{id:'',provinceid:'',cityname:''},
            showFlag:false,
            showFlag2:false,
            citytotal:0,
            pagesize:5,
            currentpage:1,
            rules:{
                provinceid:[  
                        { required: true, message: '请输入省份', trigger: 'blur' }
                    ],
                cityname:[
                        { required: true, message: '请输入城市', trigger: 'blur' },
                        { min: 1, max: 5, message: '长度在 1 到 5 个字符', trigger: 'blur' }
                    ]
            },
            province:[],
           
        }
    },
    mounted: function () {
        this.initData();
        },
        methods:{
        //初始化城市列表
        initData(){
             this.$http.get('/api/city').then(response => {
              console.log(response.data);
             this.tableDate=response.data.citys;
             this.citytotal=response.data.count;

         }, response => {
             console.log("error");
         });
        },
        //更新城市列表
        upd(row){
            this.$http.get('/api/city/'+row.id).then(response => {
            //console.log(response.data);
            this.city.id=response.data.city.id;
            this.city.provinceid=response.data.city.provinceid;
            this.city.cityname=response.data.city.cityname;
           // console.log(this.city);
            this.showFlag=true;
         }, response => {
             console.log("error");
         });
        this.showProvider();


        },
        //删除选中城市
        del(row){
            this.$confirm('此操作将永久删除该信息, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
            this.$http.delete('/api/city/'+row.id).then(response=>{
                console.log(response.data);
                this.initData();
            });
            this.$message({
            type: 'success',
            message: '删除成功!'
          });
        }).catch(() => {
            this.$message({
            type: 'info',
            message: '已取消删除'
          });          
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
            this.showProvider();
            this.city.id='';
            this.city.provinceid='';
            this.city.cityname='';
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
        
    },
    //显示省份列表
    showProvider(){
        this.$http.get('/api/province').then(response => {
            console.log(response.data.ProvinceStatus);
            this.province=response.data.ProvinceStatus;

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
<style>
.el-select-dropdown {
    width: 100px;
}
</style>
>
>
