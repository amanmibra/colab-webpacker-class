import axios from 'axios';

const getPosts = () =>
  axios.get('/api/posts');

const getPost = id =>
  axios.get(`/api/posts/${id}`);

export {
  getPosts,
  getPost,
};
