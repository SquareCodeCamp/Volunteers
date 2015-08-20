module SqBootstrap
  module Rails
    class Engine < ::Rails::Engine
      initializer 'sq-bootstrap-sass.assets.precompile' do |app|
        %w(stylesheets javascripts fonts images).each do |sub|
          app.config.assets.paths << root.join('assets', sub).to_s
        end
        app.config.assets.precompile << %r(sq-bootstrap/glyphicons-halflings-regular\.(?:eot|svg|ttf|woff2?)$)
        app.config.assets.precompile << %r(sq-bootstrap/sq-icons-regular\.(?:eot|svg|ttf|woff2?)$)
        app.config.assets.precompile << %r(sq-bootstrap/sq-market-(?:thin|light|regular|medium|bold)(?:-italic)?\.(?:eot|svg|ttf|woff2?)$)
      end
    end
  end
end
