MRuby::Build.new do |conf|
  toolchain :gcc
  conf.gembox 'default'
  conf.gem :github => 'iij/mruby-io'
  conf.gem :github => 'iij/mruby-tls-openssl'
  conf.gem :github => 'iij/mruby-process'
  conf.gem :github => 'iij/mruby-pack'
  conf.gem :github => 'iij/mruby-env'
  conf.gem :github => 'iij/mruby-dir'
  conf.gem :github => 'iij/mruby-digest'
  conf.gem :github => 'iij/mruby-socket'
  conf.gem :github => 'iij/mruby-webapi'
  conf.gem :github => 'mattn/mruby-json'
  conf.gem :github => 'matsumoto-r/mruby-redis'
  conf.gem :github => 'matsumoto-r/mruby-vedis'
  conf.gem :github => 'matsumoto-r/mruby-sleep'
  conf.gem :github => 'matsumoto-r/mruby-userdata'
  conf.gem :github => 'matsumoto-r/mruby-uname'
  conf.gem :github => 'mattn/mruby-onig-regexp'
  conf.gem :github => 'ksss/mruby-file-stat'
  conf.gem :github => 'matsumoto-r/mruby-mod-mruby-ext'
  conf.cc do |cc|
    if ENV['BUILD_TYPE'] == "debug"
      cc.flags << '-fPIC -g3 -Wall -Werror-implicit-function-declaration'
    else
      cc.flags << '-fPIC'
    end
    if ENV['BUILD_BIT'] == "64"
      cc.flags << ' -DMRB_INT64'
    end
  end
  conf.linker do |linker|
    if ENV['BUILD_BIT'] == "64"
      linker.flags = '-DMRB_INT64'
    end
  end
end
