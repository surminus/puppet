task :lint do
  sh "bundle exec puppet-lint manifests modules"
  sh "bundle exec puppet-lint modules"
end

task :default => 'lint'
