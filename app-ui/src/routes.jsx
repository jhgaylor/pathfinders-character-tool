// src/routes.js
import React from 'react'
import { Route, IndexRoute } from 'react-router'
import Hello from './components/Hello.jsx';

const routes = (
  <Route path="/">
    <IndexRoute component={Hello} />
  </Route>
);

export default routes;