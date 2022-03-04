const user = {
  state: {
    userId: "",
    username: "",
    avatar: "",
    userRole: ""
  },
  getters: {
    userId: state => {
      let userId = state.userId;
      if (!userId) {
        userId = JSON.parse(window.localStorage.getItem("userId") || null);
      }
      return userId;
    },
    username: state => {
      let username = state.username;
      if (!username) {
        username = JSON.parse(window.localStorage.getItem("username") || null);
      }
      return username;
    },
    avatar: state => {
      let avatar = state.avatar;
      if (!avatar) {
        avatar = JSON.parse(window.localStorage.getItem("avatar") || null);
      }
      return avatar;
    },
    userRole: state => {
      let userRole = state.userRole;
      if (!userRole) {
        userRole = JSON.parse(window.localStorage.getItem("userRole") || null);
      }
      return userRole;
    }
  },
  mutations: {
    setUserId: (state, userId) => {
      state.userId = userId;
      window.localStorage.setItem("userId", JSON.stringify(userId));
    },
    setUsername: (state, username) => {
      state.username = username;
      window.localStorage.setItem("username", JSON.stringify(username));
    },
    setAvatar: (state, avatar) => {
      state.avatar = avatar;
      window.localStorage.setItem("avatar", JSON.stringify(avatar));
    },
    setUserRole: (state, userRole) => {
      state.userRole = userRole;
      window.localStorage.setItem("userRole", JSON.stringify(userRole));
    }
  },
  actions: {}
};

export default user;
