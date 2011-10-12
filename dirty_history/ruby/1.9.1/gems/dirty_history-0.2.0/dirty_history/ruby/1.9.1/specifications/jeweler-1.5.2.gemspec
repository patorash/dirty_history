# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jeweler}
  s.version = "1.5.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Josh Nichols"]
  s.date = %q{2010-12-19}
  s.default_executable = %q{jeweler}
  s.description = %q{Simple and opinionated helper for creating Rubygem projects on GitHub}
  s.email = %q{josh@technicalpickles.com}
  s.executables = ["jeweler"]
  s.files = ["test/fixtures/bar/lib/foo_the_ultimate_lib.rb", "test/fixtures/existing-project-with-version-constant/lib/existing_project_with_version.rb", "test/fixtures/existing-project-with-version-constant/test/existing_project_with_version_test.rb", "test/fixtures/existing-project-with-version-constant/test/test_helper.rb", "test/fixtures/existing-project-with-version-plaintext/lib/existing_project_with_version.rb", "test/fixtures/existing-project-with-version-plaintext/test/existing_project_with_version_test.rb", "test/fixtures/existing-project-with-version-plaintext/test/test_helper.rb", "test/fixtures/existing-project-with-version-yaml/lib/existing_project_with_version.rb", "test/fixtures/existing-project-with-version-yaml/test/existing_project_with_version_test.rb", "test/fixtures/existing-project-with-version-yaml/test/test_helper.rb", "test/jeweler/commands/test_build_gem.rb", "test/jeweler/commands/test_install_gem.rb", "test/jeweler/commands/test_release_to_gemcutter.rb", "test/jeweler/commands/test_release_to_git.rb", "test/jeweler/commands/test_release_to_github.rb", "test/jeweler/commands/test_validate_gemspec.rb", "test/jeweler/commands/test_write_gemspec.rb", "test/jeweler/commands/version/test_base.rb", "test/jeweler/commands/version/test_bump_major.rb", "test/jeweler/commands/version/test_bump_minor.rb", "test/jeweler/commands/version/test_bump_patch.rb", "test/jeweler/commands/version/test_write.rb", "test/jeweler/generator/test_application.rb", "test/jeweler/generator/test_options.rb", "test/jeweler/test_gemspec_helper.rb", "test/jeweler/test_generator.rb", "test/jeweler/test_generator_initialization.rb", "test/jeweler/test_generator_mixins.rb", "test/jeweler/test_specification.rb", "test/jeweler/test_tasks.rb", "test/jeweler/test_version_helper.rb", "test/shoulda_macros/jeweler_macros.rb", "test/test_helper.rb", "test/test_jeweler.rb", "bin/jeweler"]
  s.homepage = %q{http://github.com/technicalpickles/jeweler}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Opinionated tool for creating and managing RubyGem projects}
  s.test_files = ["test/fixtures/bar/lib/foo_the_ultimate_lib.rb", "test/fixtures/existing-project-with-version-constant/lib/existing_project_with_version.rb", "test/fixtures/existing-project-with-version-constant/test/existing_project_with_version_test.rb", "test/fixtures/existing-project-with-version-constant/test/test_helper.rb", "test/fixtures/existing-project-with-version-plaintext/lib/existing_project_with_version.rb", "test/fixtures/existing-project-with-version-plaintext/test/existing_project_with_version_test.rb", "test/fixtures/existing-project-with-version-plaintext/test/test_helper.rb", "test/fixtures/existing-project-with-version-yaml/lib/existing_project_with_version.rb", "test/fixtures/existing-project-with-version-yaml/test/existing_project_with_version_test.rb", "test/fixtures/existing-project-with-version-yaml/test/test_helper.rb", "test/jeweler/commands/test_build_gem.rb", "test/jeweler/commands/test_install_gem.rb", "test/jeweler/commands/test_release_to_gemcutter.rb", "test/jeweler/commands/test_release_to_git.rb", "test/jeweler/commands/test_release_to_github.rb", "test/jeweler/commands/test_validate_gemspec.rb", "test/jeweler/commands/test_write_gemspec.rb", "test/jeweler/commands/version/test_base.rb", "test/jeweler/commands/version/test_bump_major.rb", "test/jeweler/commands/version/test_bump_minor.rb", "test/jeweler/commands/version/test_bump_patch.rb", "test/jeweler/commands/version/test_write.rb", "test/jeweler/generator/test_application.rb", "test/jeweler/generator/test_options.rb", "test/jeweler/test_gemspec_helper.rb", "test/jeweler/test_generator.rb", "test/jeweler/test_generator_initialization.rb", "test/jeweler/test_generator_mixins.rb", "test/jeweler/test_specification.rb", "test/jeweler/test_tasks.rb", "test/jeweler/test_version_helper.rb", "test/shoulda_macros/jeweler_macros.rb", "test/test_helper.rb", "test/test_jeweler.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<git>, [">= 1.2.5"])
      s.add_runtime_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<mhennemeyer-output_catcher>, [">= 0"])
      s.add_development_dependency(%q<rr>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<redgreen>, [">= 0"])
      s.add_development_dependency(%q<test-construct>, [">= 0"])
      s.add_development_dependency(%q<yard>, ["~> 0.6.0"])
      s.add_development_dependency(%q<bluecloth>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<timecop>, [">= 0"])
      s.add_development_dependency(%q<activesupport>, ["~> 2.3.5"])
      s.add_development_dependency(%q<ruby-debug>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<git>, [">= 1.2.5"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<mhennemeyer-output_catcher>, [">= 0"])
      s.add_dependency(%q<rr>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<redgreen>, [">= 0"])
      s.add_dependency(%q<test-construct>, [">= 0"])
      s.add_dependency(%q<yard>, ["~> 0.6.0"])
      s.add_dependency(%q<bluecloth>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<timecop>, [">= 0"])
      s.add_dependency(%q<activesupport>, ["~> 2.3.5"])
      s.add_dependency(%q<ruby-debug>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<git>, [">= 1.2.5"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<mhennemeyer-output_catcher>, [">= 0"])
    s.add_dependency(%q<rr>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<redgreen>, [">= 0"])
    s.add_dependency(%q<test-construct>, [">= 0"])
    s.add_dependency(%q<yard>, ["~> 0.6.0"])
    s.add_dependency(%q<bluecloth>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<timecop>, [">= 0"])
    s.add_dependency(%q<activesupport>, ["~> 2.3.5"])
    s.add_dependency(%q<ruby-debug>, [">= 0"])
  end
end
