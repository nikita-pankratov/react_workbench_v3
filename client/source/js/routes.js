import React, { Component } from 'react';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';

// import App from 'source/js/containers/App';
// import Dashboard from 'source/js/containers/Dashboard';
// import Form from 'source/js/containers/Form';
// import About from 'source/js/containers/About';
import NotFound from './containers/NotFound/index.jsx';

import Base from './components/Base.jsx';
import HomePage from './components/HomePage.jsx';
import LoginPage from './containers/Login/index.jsx';
import SignUpPage from './containers/SignUp/index.jsx';


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
