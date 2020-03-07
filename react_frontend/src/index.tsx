import * as React from 'react';
import * as ReactDOM from 'react-dom';
import './index.css';
import { App } from './App';

declare var module;

fetch('/config.json'
  ).then(async (response) => {
    const config = await response.json();
    ReactDOM.render(
      <App apiUrl={config.apiUrl} />,
      document.getElementById('root')
    );
  });


if (module.hot) {
  module.hot.accept();
}