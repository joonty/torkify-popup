require 'notifier'

module Torkify::Popup
  class Observer
    attr_reader :me

    def initialize(options = {})
      @me = "torkify-popup"
    end

    def alert_info(title, body)
      unless @block_alerts
        Torkify.logger.debug { "#{me}: notification, title: '#{title}', message: '#{message}'" }
        Notifier.notify(
          image: options[:ok_image],
          title: title,
          message: body
        )
      end
    end

    def alert_error(title, body)
      unless @block_alerts
        Torkify.logger.debug { "#{me}: error notification, title: '#{title}', message: '#{message}'" }
        Notifier.notify(
          image: options[:error_image],
          title: title,
          message: body
        )
      end
    end

    def on_pass(event)
      alert_info "Yay, a test passed!", event.file
    end

    def on_run_all_test_files
      @block_alerts = true
    end

    def on_ran_all_test_files(event)
      @block_alerts = false
      total = event.failed.length + event.passed.length
      if event.failed.any?
        alert_error('All tests ran with failures!',
                    "#{total} tests, #{event.passed.length} passed, #{event.failed.length} failed in #{event.time} seconds")
      else
        alert_info('All tests ran successfully', "#{total} tests ran in #{event.time} seconds")
      end
    end

    def on_fail(event)
      alert_error "Uh-oh, a test failed", event.file
    end

    def method_missing(name, *args)
      puts "Event: #{name}"
    end
  end

end
