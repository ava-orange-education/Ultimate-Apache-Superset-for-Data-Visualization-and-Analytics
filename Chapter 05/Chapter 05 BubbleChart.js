import React, { useEffect, useRef } from 'react';
import * as d3 from 'd3';

const BubbleChart = ({ width, height, data, x, y, size, colorScheme }) => {
  const ref = useRef();

  useEffect(() => {
    const svg = d3.select(ref.current)
      .attr('width', width)
      .attr('height', height);

    const color = d3.scaleOrdinal(d3.schemeCategory10);

    const xScale = d3.scaleLinear()
      .domain([0, d3.max(data, d => d[x])])
      .range([50, width - 50]);

    const yScale = d3.scaleLinear()
      .domain([0, d3.max(data, d => d[y])])
      .range([height - 50, 50]);

    const sizeScale = d3.scaleSqrt()
      .domain([0, d3.max(data, d => d[size])])
      .range([5, 20]);

    svg.selectAll('circle')
      .data(data)
      .join('circle')
      .attr('cx', d => xScale(d[x]))
      .attr('cy', d => yScale(d[y]))
      .attr('r', d => sizeScale(d[size]))
      .attr('fill', d => color(d.category))
      .attr('opacity', 0.7);
  }, [data, width, height, x, y, size]);

  return <svg ref={ref}></svg>;
};

export default BubbleChart;
