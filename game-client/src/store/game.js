import { BASE_URL } from "../api/config";
import { ICON } from "../assets/icon/index";

const game = {
  state: {
    id: null, // 游戏ID

    tempList: {} // 信息
  },
  getters: {
    id: state => {
      let id = state.id;
      if (!id) {
        id = JSON.parse(window.sessionStorage.getItem("id") || null);
      }
      return id;
    },

    tempList: state => {
      let tempList = state.tempList;
      if (JSON.stringify(tempList) === "{}") {
        tempList = JSON.parse(
          window.sessionStorage.getItem("tempList") || null
        );
      }
      return tempList;
    }
  },
  mutations: {
    setId: (state, id) => {
      state.id = id;
      window.sessionStorage.setItem("id", JSON.stringify(id));
    },

    setTempList: (state, tempList) => {
      state.tempList = tempList;
      window.sessionStorage.setItem("tempList", JSON.stringify(tempList));
    }
  },
  actions: {}
};

export default game;
