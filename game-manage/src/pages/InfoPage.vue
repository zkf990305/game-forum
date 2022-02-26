<template>
  <div>
    <el-row :gutter="20" class="mgb20">
      <el-col :span="6">
        <el-card shadow="hover" :body-style="{ padding: '0px' }">
          <div class="grid-content grid-con-1">
            <div class="grid-cont-right">
              <div class="grid-num">{{ userCount }}</div>
              <div>用户总数</div>
            </div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover" :body-style="{ padding: '0px' }">
          <div class="grid-content grid-con-2">
            <div class="grid-cont-right">
              <div class="grid-num">{{ postCount }}</div>
              <div>帖子总数</div>
            </div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover" :body-style="{ padding: '0px' }">
          <div class="grid-content grid-con-3">
            <div class="grid-cont-right">
              <div class="grid-num">{{ gameCount }}</div>
              <div>游戏加盟</div>
            </div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover" :body-style="{ padding: '0px' }">
          <div class="grid-content grid-con-4">
            <div class="grid-cont-right">
              <div class="grid-num">{{ commentCount }}</div>
              <div>评价条数</div>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="20">
      <h3 style="margin-bottom: 20px">用户性别比例</h3>
      <div class="cav-info" style="background-color: white">
        <ve-pie :data="userGender" :theme="options"></ve-pie>
      </div>
    </el-row>
    <el-row :gutter="20">
      <h3 style="margin-bottom: 20px">用户地区分布</h3>
      <div class="cav-info" style="background-color: white">
        <ve-histogram :data="cities" :theme="options3"></ve-histogram>
      </div>
    </el-row>
  </div>
</template>

<script>
import mixin from "../mixins";
import { HttpManager } from "../api/index";

export default {
  mixins: [mixin],

  data() {
    return {
      user: [],
      cities: {
        columns: ["地区", "总数"],
        rows: [
          {
            地区: "北京",
            总数: 0
          },
          {
            地区: "天津",
            总数: 0
          },
          {
            地区: "河北",
            总数: 0
          },
          {
            地区: "山西",
            总数: 0
          },
          {
            地区: "内蒙古",
            总数: 0
          },
          {
            地区: "辽宁",
            总数: 0
          },
          {
            地区: "吉林",
            总数: 0
          },
          {
            地区: "黑龙江",
            总数: 0
          },
          {
            地区: "上海",
            总数: 0
          },
          {
            地区: "江苏",
            总数: 0
          },
          {
            地区: "浙江",
            总数: 0
          },
          {
            地区: "安徽",
            总数: 0
          },
          {
            地区: "福建",
            总数: 0
          },
          {
            地区: "江西",
            总数: 0
          },
          {
            地区: "山东",
            总数: 0
          },
          {
            地区: "河南",
            总数: 0
          },
          {
            地区: "湖北",
            总数: 0
          },
          {
            地区: "湖南",
            总数: 0
          },
          {
            地区: "广东",
            总数: 0
          },
          {
            地区: "广西",
            总数: 0
          },
          {
            地区: "海南",
            总数: 0
          },
          {
            地区: "重庆",
            总数: 0
          },
          {
            地区: "四川",
            总数: 0
          },
          {
            地区: "贵州",
            总数: 0
          },
          {
            地区: "云南",
            总数: 0
          },
          {
            地区: "西藏",
            总数: 0
          },
          {
            地区: "陕西",
            总数: 0
          },
          {
            地区: "甘肃",
            总数: 0
          },
          {
            地区: "青海",
            总数: 0
          },
          {
            地区: "宁夏",
            总数: 0
          },
          {
            地区: "新疆",
            总数: 0
          },
          {
            地区: "香港",
            总数: 0
          },
          {
            地区: "澳门",
            总数: 0
          },
          {
            地区: "台湾",
            总数: 0
          },
          {
            地区: "未知",
            总数: 0
          }
        ]
      },
      userGender: {
        columns: ["性别", "总数"],
        rows: [
          { 性别: "男", 总数: 0 },
          { 性别: "女", 总数: 0 },
          { 性别: "未知", 总数: 0 }
        ]
      },

      options: {
        color: ["#87CEFA", "#FFC0CB", "#F5F5DC"]
      },
      options1: {
        color: ["#1E90FF", "#7B68EE"]
      },
      options2: {
        color: ["#FEED78"],
        tooltip: {
          trigger: "axis",
          axisPointer: {
            // 坐标轴指示器，坐标轴触发有效
            type: "shadow" // 默认为直线，可选为：'line' | 'shadow'
          }
        },
        grid: {
          left: "3%",
          right: "4%",
          bottom: "3%",
          containLabel: true
        }
      },
      options3: {
        color: ["#FD8A61"],
        tooltip: {
          trigger: "axis",
          axisPointer: {
            // 坐标轴指示器，坐标轴触发有效
            type: "shadow" // 默认为直线，可选为：'line' | 'shadow'
          }
        },
        grid: {
          left: "3%",
          right: "4%",
          bottom: "3%",
          containLabel: true
        }
      },

      userCount: 0,
      postCount: 0,
      gameCount: 0,
      commentCount: 0
    };
  },
  mounted() {
    this.getUser();
    this.getGame();
    this.getPost();
    this.getComment();
  },
  methods: {
    getUser() {
      HttpManager.getAllUser().then(res => {
        this.userCount = res.data.length;
        this.userGender.rows[0]["总数"] = this.setGender(1, res.data);
        this.userGender.rows[1]["总数"] = this.setGender(0, res.data);
        this.userGender.rows[2]["总数"] = this.setGender(null, res.data);
        for (let i = 0; i < 35; i++) {
          this.cities.rows[i]["总数"] = this.setCity(
            this.cities.rows[i]["地区"],
            res.data
          );
        }
      });
    },
    setCity(address, arr) {
      let count = 0;
      for (let item of arr) {
        if (address === item.address) {
          count++;
        }
      }
      return count;
    },
    setGender(gender, arr) {
      let count = 0;
      for (let item of arr) {
        if (gender === item.gender) {
          count++;
        }
      }
      return count;
    },

    getGame() {
      HttpManager.getAllGame()
        .then(res => {
          this.gameCount = res.data.length;
        })
        .catch(err => {
          console.log(err);
        });
    },
    getPost() {
      HttpManager.getAllPost()
        .then(res => {
          this.postCount = res.data.length;
        })
        .catch(err => {
          console.log(err);
        });
    },
    getComment() {
      HttpManager.getAllComment()
        .then(res => {
          this.commentCount = res.data.length;
        })
        .catch(err => {
          console.log(err);
        });
    }
  }
};
</script>

<style>
.grid-content {
  display: flex;
  align-items: center;
  height: 100px;
}

.grid-cont-right {
  flex: 1;
  text-align: center;
  font-size: 14px;
  color: #999;
}

.grid-num {
  font-size: 30px;
  font-weight: bold;
}

.cav-info {
  border-radius: 6px;
  overflow: hidden;
}
</style>
