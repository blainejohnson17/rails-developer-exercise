require Rails.root.join('lib', 'printer')

namespace :print_stuff do
  desc "Print All Projects"
  task :projects => [:environment] do
    puts Printer.call
  end
end