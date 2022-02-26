import { get, post, put, deletes } from "./request";

const HttpManager = {
  // =======================> 管理员 API
  // 是否登录成功
  getLoginStatus: params => post(`gf-user/login/status`, params),
  // 找回密码
  retrievePass: data => post(`gf-user/retrieve`, data),

  // =======================> 用户 API
  // 返回所有用户
  getAllUser: () => get(`gf-user/user`),

  // 更新用户信息
  updateUserMsg: params => put(`gf-user-info/update`, params),

  // 返回指定ID的用户
  getUserOfId: id => get(`user/detail?id=${id}`),
  // 添加用户
  setUser: data => post(`gf-user/register`, data),

  // 删除用户
  deleteUser: id => deletes(`gf-user/delete/` + id),

  // 批量删除用户
  removeBatch: data => post(`gf-user/removeBatch`, data),

  // 获取个人资料
  getGfUserByUserId: id => get(`gf-user/details/` + id),

  // 修改密码
  updateUserPwd: data => post(`gf-user/updatePwd`, data),

  // 更新个人资料
  updateInfo: data => put(`gf-user-info/updateInfo`, data),

  // 上传更新头像
  updateUserPic: data => post(`gf-user/upload/avatar/update`, data),

  // =======================> 游戏 API
  // 获取全部游戏类型列表
  getAllGameTypes: () => get(`gf-game-type/typeList`),

  // 返回所有游戏
  getAllGame: () => get(`gf-game/gameList`),
  // 添加游戏
  setGame: data => post(`gf-game/addGame`, data),

  // 更新游戏信息
  updateGameMsg: params => put(`gf-game/update`, params),

  // 删除游戏
  deleteGame: id => deletes(`gf-game/delete/` + id),

  // 批量删除游戏
  removeBatchOfGame: data => post(`gf-game/removeBatch`, data),

  // =======================> 帖子 API
  // 获取全部帖子
  getAllPost: () => get(`gf-post/allPostList`),

  // 批量删除帖子
  removeBatchOfPost: data => post(`gf-post/removeBatch`, data),

  // 删除帖子
  deletePost: id => deletes(`gf-post/delete/` + id),

  // 状态修改
  changePostStatus: data => post(`gf-post/changePostStatus`, data),

  // =======================> 友情链接 API
  // 返回所有友链
  getAllLinks: () => get(`gf-links/linkList`),

  // 添加友链
  setLinks: data => post(`gf-links/addLinks`, data),

  // 更新友链信息
  updateLinksMsg: params => put(`gf-links/update`, params),

  // 删除友链
  deleteLinks: id => deletes(`gf-links/delete/` + id),

  // 批量删除友链
  removeBatchOfLinks: data => post(`gf-links/removeBatch`, data),

  // =======================> 公告 API
  // 返回所有公告
  getAllNews: () => get(`gf-news/newsList`),

  // 添加公告
  setNews: data => post(`gf-news/addNews`, data),

  // 更新公告信息
  updateNewsMsg: params => put(`gf-news/update`, params),

  // 删除公告
  deleteNews: id => deletes(`gf-news/delete/` + id),

  // 批量删除公告
  removeBatchOfNews: data => post(`gf-news/removeBatch`, data),

  // =======================> 收藏列表 API
  // 返回的指定用户ID收藏列表
  getCollectionOfUser: userId => get(`collection/detail?userId=${userId}`),
  // 删除收藏的歌曲
  deleteCollection: (userId, songId) =>
    get(`/collection/delete?userId=${userId}&&songId=${songId}`),

  // =======================> 评论列表 API

  // 获取全部评论
  getAllComment: () => get(`gf-post-comment/allComment`),

  // 批量删除评论
  removeBatchOfComment: data => post(`gf-post-comment/removeBatch`, data),

  // 删除评论
  deleteComment: id => deletes(`gf-post-comment/delete/` + id),

  // 状态修改
  changeCommentStatus: data => post(`gf-post-comment/changeCommentStatus`, data)
};

export { HttpManager };
