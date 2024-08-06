<script>
    import { LayerCake, Svg, flatten, stack } from 'layercake';
  
    import { scaleBand, scaleOrdinal } from 'd3-scale';
    import { format } from 'd3-format';
  
    import Bar from '../Bar/_components/Bar.svelte';
    import AxisX from '../Bar/_components/AxisX.svelte';
    import AxisY from '../Bar/_components/AxisY.svelte';
  
    // This example loads csv data as json using @rollup/plugin-dsv
    // import data from '../Bar/_data/groups.csv';
   
  
    const xKey = 'value';
    const yKey = 'race';
  
    const data = [
      {value: 42, race: 'White'},
      {value: 117, race: 'Hispanic/Latino'},
      {value: 1416, race: 'Black'}
    ]
    /* --------------------------------------------
     * Cast data
     */

     
   data.forEach(d => {
    d[xKey] = +d[xKey];
  });

    const formatLabelY = (d, i) => {
      const formatted = format(`~s`)(d);
      
      if (d === 600) {
        return `${formatted} buildings`;
      } else {
        return formatted;
      }
    };
    const fill = '#FFC612';


   
  </script>
  
  <div class="chart-container">
    <LayerCake
        padding={{ top: 0, right: 0, bottom: 20, left: 100 }}
        x={xKey}
        y={yKey}
        yScale={scaleBand().paddingInner(0.05)}
        xDomain={[0, null]}
        {data}
    >
      <Svg>
        <AxisX
          gridlines={false}
          tickMarks={true}
          tickMarkLength={6}
          ticks={[0, 700, 1400]}
          title="Number of buildings"
        />
        <AxisY
          gridlines= {false}
        />
        <Bar {fill} />
      </Svg>
    </LayerCake>
  </div>


  <style lang='scss'>
     .chart-container {
      width: 100%;
      height: 150px;
    }
    
    :global(.axis .tick text) {
        font-family: 'Sofia Pro', 'sans-serif';
    }
  </style>