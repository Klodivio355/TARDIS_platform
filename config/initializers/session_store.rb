Rails.application.config.session_store :active_record_store, key: (Rails.env.production? ? '_tardis_project_session_id' : (Rails.env.demo? ? '_tardis_project_demo_session_id' : '_tardis_project_dev_session_id')),
                                                             secure: (Rails.env.demo? || Rails.env.production?),
                                                             httponly: true
