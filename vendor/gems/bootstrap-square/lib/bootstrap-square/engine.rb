module Bootstrap
  module Rails
    class Engine < ::Rails::Engine
      initializer "bootstrap-square.assets.precompile" do |app|
        app.config.assets.precompile << %r(glyphicons-halflings-regular\.(?:eot|svg|ttf|woff)$)
        app.config.assets.precompile << %r(.*sqmarket-(?:light|regular|medium|bold|thin)(?:-italic)?\.(?:eot|otf|svg|ttf|woff)$)
      end
    end
  end
end
