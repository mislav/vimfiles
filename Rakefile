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
    ruby = %w[/usr/bin/ruby1.8 /usr/bin/ruby].find {|rb| File.executable? rb } || 'ruby'
    rbenv = {'RBENV_VERSION' => 'system'}
    sh rbenv, ruby, 'extconf.rb'
    sh "make clean && make"
  end
end
