require 'rails/generators'

class TestAppGenerator < Rails::Generators::Base
  source_root "./spec/test_app_templates"

  # if you need to generate any additional configuration
  # into the test app, this generator will be run immediately
  # after setting up the application

  def add_gems
    gem 'blacklight'
    gem 'hydra-head'
    gem 'hydra-editor'
    Bundler.with_clean_env do
      run "bundle install"
    end
  end

  def run_blacklight_generator
    say_status("warning", "GENERATING BL", :yellow)
    generate "blacklight:install --devise"
    gsub_file "app/controllers/application_controller.rb", "layout 'blacklight'", "layout 'application'"
  end

  def run_hydra_generator
    say_status("warning", "GENERATING Hydra", :yellow)
    generate "hydra:head -f"
  end

  def run_migrations
    rake "db:migrate"
    rake "db:test:prepare"
  end

  def add_hydra_editor_route
    insert_into_file "config/routes.rb", after: '.draw do' do
      "\n  mount HydraEditor::Engine => \"/\"\n"
    end
  end

  def add_create_ability
    # Required for hydra-head 7+
    insert_into_file "app/models/ability.rb", after: 'custom_permissions' do
      "\n    can :create, :all if user_groups.include? 'registered'\n"
    end

  end

  def install_engine
    generate 'hydra_controlled_vocabularies:install'
  end
end

