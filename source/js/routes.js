import React, { Component } from 'react';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';

import App from 'views/App';
import Dashboard from 'views/Dashboard';
import Form from 'views/Form';
import About from 'views/About';
import NotFound from 'views/NotFound';

import Base from './components/Base.jsx';
import HomePage from './components/HomePage.jsx';
import LoginPage from './views/Login/index.jsx';
import SignUpPage from './views/SignUp/index.jsx';


const publicPath = '/';

export const routeCodes = {
    // DASHBOARD: publicPath,
    // ABOUT: `${ publicPath }about`,
    // FORM: `${ publicPath }forms`,
    HOMEPAGE: publicPath,
    LOGIN: `${ publicPath }login`,
    SIGNUP: `${ publicPath }signup`,


};

export default class Routes extends Component {
  render() {
    return (
      <Router history={ browserHistory }>
        <Route path={ publicPath } component={ Base }>
          <IndexRoute component={ HomePage } />
          <Route path={ routeCodes.HOMEPAGE } component={ HomePage } />
          <Route path={ routeCodes.LOGIN } component={ LoginPage } />
          <Route path={ routeCodes.SIGNUP } component={ SignUpPage } />

          <Route path='*' component={ NotFound } />
        </Route>
      </Router>
    );
  }
}
