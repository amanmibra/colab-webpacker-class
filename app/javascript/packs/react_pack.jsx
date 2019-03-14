import React from 'react';
import { render } from 'react-dom';

import BlogApp from './../src';

document.addEventListener('DOMContentLoaded', () =>
  render(<BlogApp />, document.getElementById('root'))
);
