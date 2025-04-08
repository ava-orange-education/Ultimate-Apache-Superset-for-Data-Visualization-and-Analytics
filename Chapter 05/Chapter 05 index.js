// src/plugin/index.js

import { ChartPlugin } from '@superset-ui/core';
import transformProps from './transformProps';
import controlPanel from './controlPanel';

export default class BubbleChartPlugin extends ChartPlugin {
  constructor() {
    super({
      metadata: {
        name: 'Bubble Chart',
        description: 'A customizable bubble chart for data visualization.',
        thumbnail: 'thumbnail.png', // Add a relevant thumbnail for the chart
      },
      loadChart: () => import('./BubbleChart'),
      transformProps,
      controlPanel,
    });
  }
}

