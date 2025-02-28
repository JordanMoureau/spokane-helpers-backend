Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'https://z7g9u3.netlify.app'
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options]
    end
  end
  