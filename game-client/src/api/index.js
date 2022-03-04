import { get, post, put } from "./request";

const HttpManager = {
  // =======================> 用户 API
  // 登录
  loginIn: data => post(`gf-user/login/status`, data),
  // 注册
  SignUp: data => post(`gf-user/register`, data),
  // 更新用户信息
  updateUserMsg: params => put(`gf-user-info/update`, params),

  // 获取评论用户的昵称和头像
  getGfUserInfoByUserId: id => get(`gf-user/detail/` + id),

  // 返回指定ID的用户
  getUserOfId: id => get(`gf-user-info/detail/` + id),

  // 找回密码
  retrievePass: data => post(`gf-user/retrieve`, data),

  // =======================> 友链 API
  // 获取全部友链
  getLinkList: () => get(`gf-links/linkList`),

  // =======================> 留言 API
  // 提交留言
  addMessage: data => post(`gf-message/addMessage`, data),

  // =======================> 游戏分类 API
  // 获取全部type
  getGameTypeList: () => get(`gf-game-type/typeList`),

  // =======================> 游戏 API
  // 获取全部游戏
  getGameList: () => get("gf-game/gameList"),
  // 获取前8条游戏
  gameListOfTheFirstEight: () => get(`gf-game/gameList8`),
  // 获取对应类型的游戏
  getGameListOfStyle: style => get(`gf-game/style/detail/` + style),

  // 按游戏名模糊查询游戏列表
  getGameListOfLikeTitle: title => get(`gf-game/likeTitle/detail/` + title),

  // =======================> 帖子 API
  // 发表帖子
  addPost: data => post("gf-post/addPost", data),

  // 获取全部帖子
  getAllPost: () => get(`gf-post/postList`),

  // 获取对应分类的帖子
  getPostListOfClassify: classify => get(`gf-post/classify/detail/` + classify),

  // 获取对应分类的帖子
  getPostListOfTag: tag => get(`gf-post/tag/detail/` + tag),

  // 按游戏名模糊查询帖子列表
  getPostListOfLikeTitle: title => get(`gf-post/likeTitle/detail/` + title),

  // 查询用户自己发布的帖子列表
  getListPostOfMe: id => get(`gf-post/postList/` + id),

  // =======================> 帖子分类 API

  // 获取帖子分类列表
  getAllPostClassify: () => get(`gf-post-classify/postClassifyList`),

  // 通过帖子id查找帖子分类
  getPostClassifyOfPostId: id => get(`gf-post-classify/classify/detail/` + id),

  // =======================> 帖子标签 API
  // 获取标签列表
  getAllPostTag: () => get(`gf-post-tag/tagList`),

  // 通过帖子id查找帖子标签
  getPostTagOfPostId: id => get(`gf-post-tag/tag/detail/` + id),

  // =======================> 公告 API
  // 获取全部公告
  getAllNewsList: () => get(`gf-news/newsList`),
  // 获取前8条公告
  newsListOfTheFirstEight: () => get(`gf-news/newsList8`),

  // =======================> 收藏 API

  // 查看是否收藏了
  selectByCollect: data => post(`gf-post-collect/isCollect`, data),

  // 添加收藏
  setCollect: data => post(`gf-post-collect/add`, data),

  // 取消收藏
  deleteCollect: data => post(`gf-post-collect/deleteCollect`, data),

  // 返回的指定用户ID的收藏游戏
  getGameListOfCollect: id => get(`gf-game/collect/detail/` + id),
  // 返回的指定用户ID的收藏帖子
  getPostListOfCollect: id => get(`gf-post/collect/detail/` + id),

  // =======================> 评分 API
  // 提交评分
  setRank: data => post(`gf-game-rank/add`, data),
  // 获取指定游戏的评分
  getRankOfGameId: gid => get(`gf-game-rank/checkTheTotalScore/` + gid),

  // =======================> 点赞 API
  // 查看是否点赞了
  selectByLike: data => post(`gf-post-like/isLike`, data),
  // 点赞
  setLike: data => post(`gf-post-like/add`, data),
  // 取消点赞
  deleteLike: data => post(`gf-post-like/deleteLike`, data),

  // =======================> 评论 API
  // 添加评论
  setComment: data => post(`gf-post-comment/add`, data),

  // 返回所有评论
  getAllComment: (type, id) => {
    let url = "";
    // 游戏
    if (type === 1) {
      url = `gf-post-comment/game/detail/` + id;
    } else if (type === 0) {
      // 帖子
      url = `gf-post-comment/post/detail/` + id;
    }
    return get(url);
  }
};

export { HttpManager };
