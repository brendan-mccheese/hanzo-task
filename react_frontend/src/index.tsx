import * as React from 'react';
import * as ReactDOM from 'react-dom';
import './index.css';
import { App } from './App';

declare var module;

import('../static/config.json').then(() => {
  fetch('/static/config.json'
  ).then(async (response) => {
    const config = await response.json();
    ReactDOM.render(
      <App apiUrl={config.apiUrl} />,
      document.getElementById('root')
    );
  });
})

if (module.hot) {
  module.hot.accept();
}