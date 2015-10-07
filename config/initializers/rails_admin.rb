RailsAdmin.config do |config|

  config.main_app_name = ["Framgia Test System", "Admin"]
  #config.included_models = %w[ Answer, Exam, Question, Subject, Result, User]
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end

  config.current_user_method(&:current_user)

  config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ["Result"]
    end
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model "Answer" do
    visible false
  end

  config.model "Question" do
    list do
      configure :updated_at do
        hide
      end
    end

    edit do
      configure :subject do
        inline_add false
        inline_edit false
      end
    end
  end

  config.model "User" do
    exclude_fields :remember_created_at, :created_at, :reset_password_sent_at
  end
end
