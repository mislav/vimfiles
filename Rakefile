task :default => [:tmp_dirs, :update, :command_t, :link]

task :update do
  sh "git submodule update --init"
end

task :link do
  %w[vimrc gvimrc].each do |script|
    dotfile = File.join(ENV['HOME'], ".#{script}")
    if File.exist? dotfile
      warn "~/.#{script} already exists"
    else
      ln_s File.join('.vim', script), dotfile
    end
  end
end

task :tmp_dirs do
  mkdir_p "_backup"
  mkdir_p "_temp"
end

task :command_t do
  puts "Compiling Command-T plugin..."
  Dir.chdir "bundle/command-t/ruby/command-t" do
    # first try to read which ruby version is vim compiled against
    read_version = %{require "rbconfig"; print File.join(RbConfig::CONFIG["bindir"], RbConfig::CONFIG["ruby_install_name"])}
    ruby = `vim --cmd 'ruby #{read_version}' --cmd 'q' 2>&1 >/dev/null | grep -v 'Vim: Warning'`.strip
    # fall back to system rubies
    ruby = %w[/usr/bin/ruby1.8 /usr/bin/ruby].find {|rb| File.executable? rb } || 'ruby' if ruby.empty?
    cmd = Array(ruby) + %w[extconf.rb]
    sh(*cmd)
    sh "make clean && make"
  end
end
