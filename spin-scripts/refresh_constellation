#!/usr/local/bin/ruby

root_path = Dir.pwd

def async_shell(cmd, chdir)
  pid = spawn(cmd, chdir: chdir)
  Process.wait(pid)
end

Dir.glob("#{root_path}/*").each do |project_path|
  Dir.chdir(project_path)

  project_name = File.basename(project_path)
  current_branch = `git branch --show-current`.strip

  $stdout.print("Refreshing '#{project_name}' on '#{current_branch}'... ")

  command = "git fetch origin #{current_branch} && git rebase origin && update #{project_name}"
  status = system(command, chdir: project_path, [:out, :err] => "/dev/null")

  if status
    puts "done."
  else
    puts "failed!"
    puts command
  end

  puts ""
end
