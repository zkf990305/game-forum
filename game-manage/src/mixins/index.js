import { mapGetters } from "vuex";
const mixin = {
  computed: {
    ...mapGetters(["userId", "loginIn"])
  },
  methods: {
    // 提示信息
    notify(title, type) {
      this.$notify({
        title: title,
        type: type
      });
    },
    getUrl(url) {
      return this.$store.state.configure.HOST + url;
    },
    // 获取图片信息
    attachImageUrl(srcUrl) {
      return srcUrl
        ? this.$store.state.configure.HOST + srcUrl
        : "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic%2Fd8%2Fb7%2F36%2Fd8b736f5168f2a98667bce3d7ad3e5ed.jpeg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1645368420&t=83b93220ef537b2e33deedd71d4248db";
    },
    // 获取要删除列表的id
    handleDelete(id) {
      this.idx = id;
      this.delVisible = true;
    },
    // 获取批量要删除的列表
    handleSelectionChange(val) {
      this.multipleSelection = val;
    },
    // 批量删除
    delAll() {
      for (let item of this.multipleSelection) {
        this.handleDelete(item.id);
        this.deleteRow(item.id);
      }
      this.multipleSelection = [];
    },
    // 得到歌曲名字
    replaceFName(str) {
      let arr = str.split("-");
      return arr[1];
    },
    // 得到歌手名字
    replaceLName(str) {
      let arr = str.split("-");
      return arr[0];
    },
    attachBirth(val) {
      let birth = String(val).match(/[0-9-]+(?=\s)/);
      return Array.isArray(birth) ? birth[0] : birth;
    },
    changeSex(value) {
      if (value === 0) {
        return "女";
      } else if (value === 1) {
        return "男";
      } else if (value === 2) {
        return "组合";
      } else if (value === 3) {
        return "不明";
      } else if (value === "男" || value === "女") {
        return value;
      }
    },
    changeStatus(value) {
      if (value === 0) {
        return "正常";
      } else if (value === 1) {
        return "用户异常";
      }
    },
    changeRole(value) {
      if (value === 1) {
        return "超级管理员";
      } else if (value === 2) {
        return "管理";
      } else if (value === 3) {
        return "普通用户";
      } else {
        return value;
      }
    },
    toggleSex(value) {
      if (value === "女") {
        return 0;
      } else if (value === "男") {
        return 1;
      }
    },
    // 更新图片
    handleAvatarSuccess(res, file) {
      let _this = this;
      if (res.code === 1) {
        _this.imageUrl = URL.createObjectURL(file.raw);
        _this.getData();
        _this.$notify({
          title: "上传成功",
          type: "success"
        });
      } else {
        _this.$notify({
          title: "上传失败",
          type: "error"
        });
      }
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === "image/jpeg" || file.type === "image/png";
      const isLt2M = file.size / 1024 / 1024 < 2;
      if (!isJPG) {
        this.$message.error("上传头像图片只能是 JPG 格式!");
      }
      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 2MB!");
      }
      return isJPG && isLt2M;
    }
  }
};
export default mixin;
