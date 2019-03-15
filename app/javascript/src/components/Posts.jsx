import React, { Component } from 'react';

class Posts extends Component {

  render() {
    const { posts } = this.props;
    return (
      <div>
        {
          posts.map(post => (
            <div>
              <h3>{post.title}</h3>
              <p>{post.body}</p>
            </div>
          ))
        }
      </div>
    );
  }

}

export default Posts;
