import React, { Component } from 'react';

// components
import Posts from './../components/Posts';

// utils
import { getPosts } from './../utils/getPosts';

class Home extends Component {

  constructor(props) {
    super(props);
    this.state = {
      posts: [],
    };
  }

  componentDidMount() {
    getPosts()
    .then(res => {
      this.setState({
        posts: res.data.data,
      });
    })
    .catch(err => {
      console.log(err);
    });
  }

  render() {
    return (
      <div>
        <h2>Home Page</h2>
        {this.state.posts.length == 0 ?
          <h4>Loading...</h4> : null
        }
        <Posts posts={this.state.posts} />
      </div>
    );
  }

}

export default Home;
