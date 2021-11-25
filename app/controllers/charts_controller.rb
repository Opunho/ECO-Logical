class ChartsController < ApplicationController
  def index
    @chart =
      Fusioncharts::Chart.create!(
        {
          width: '600',
          height: '400',
          type: 'doughnut2d',
          renderAt: 'chartContainer',
          dataSource: {
            chart: {
              caption: 'Android Distribution for our app',
              subcaption: 'For all users in 2017',
              showpercentvalues: '1',
              defaultcenterlabel: 'Android Distribution',
              aligncaptionwithcanvas: '0',
              captionpadding: '0',
              decimals: '1',
              plottooltext:
                '<b>$percentValue</b> of our Android users are on <b>$label</b>',
              centerlabel: '# Users: $value',
              theme: 'fusion'
            },
            data: [
              { label: 'Ice Cream Sandwich', value: '1000' },
              { label: 'Jelly Bean', value: '5300' },
              { label: 'Kitkat', value: '10500' },
              { label: 'Lollipop', value: '18900' },
              { label: 'Marshmallow', value: '17904' }
            ]
          }
        }
      )
  end
end
